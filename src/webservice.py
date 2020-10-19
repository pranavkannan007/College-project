import pymysql
from flask import *
from werkzeug.utils import secure_filename

app=Flask(__name__)
con=pymysql.connect(host='localhost',port=3306,user='root',password='',db='onedayjobs')
cmd=con.cursor()
@app.route('/signup',methods=['POST'])
def signup():
    try:
        print(request.form)
        name=request.form['name']
        print(name)
        gender=request.form['gender']
        email=request.form['email']
        cnumber=request.form['cnumber']
        resume=request.files['files']
        fn=secure_filename(resume.filename)
        resume.save("static/resume/"+fn)
        place=request.form['place']
        post=request.form['post']
        pin=request.form['pin']
        password=request.form['password']
        cpassword=request.form['cpassword']
        print(cpassword)
        if password==cpassword:
            cmd.execute("insert into login values(null,'"+email+"','"+password+"','user')")
            id=con.insert_id()
            cmd.execute("insert into user values(null,'"+str(id)+"','"+name+"','"+gender+"','"+email+"','"+cnumber+"','"+fn+"','"+place+"','"+post+"','"+pin+"')")
            con.commit()

            return jsonify({'task':"success"})
        else:
            return jsonify({'task': "failed"})
    except Exception as e:
        print(str(e))
        return jsonify({'task': "failed"})


@app.route('/login', methods=['GET', 'POST'])
def login():
        try:
            uname = request.form['uname']
            passwd = request.form['pass']
            print(uname)
            try:
                cmd.execute("SELECT  `user`.`userid`,`name`,`email` FROM login  JOIN `user` ON `login`.`id`=`user`.`userid` where username='" + uname + "' and password='" + passwd + "' and usertype='user'")
                s = cmd.fetchone()
                print(s)
                if s is not None:
                    id = s[0]

                    print(id)
                    return jsonify({'task': str(id)+"#"+s[1]+"#"+s[2]})

                else:
                    return jsonify({'task': "invalid"})
            except Exception as e:
                print(str(e))
                return jsonify({'task': "invalid"})
        except Exception as e:
            print(e)
            return jsonify({'task': "success"})
@app.route('/viewprofile',methods=['GET','POST'])
def viewprofile():
    id = request.form['id']
    cmd.execute("select * from user where userid='"+str(id)+"'")
    s=cmd.fetchall()
    print(s)
    row_headers=[x[0] for x in cmd.description]
    json_data=[]
    for result in s:
        json_data.append(dict(zip(row_headers,result)))
    return jsonify(json_data)
@app.route('/updateprofile',methods=['GET','POST'])
def updateprofile():
        id =request.form['id']
        name=request.form['name']
        cnumber=request.form['number']
        resume=request.form['resume']
        place=request.form['place']
        post=request.form['post']
        pin=request.form['pin']

        cmd.execute("update user set name='"+name+"',contactnumber='"+cnumber+"',resume='"+resume+"',place='"+place+"',post='"+post+"',pin='"+pin+"' where userid='"+str(id)+"' ")
        con.commit()
        return jsonify({'task': "success"})
@app.route('/sendfeedback1',methods=['get','post'])
def sendfeedback1():
    id=request.form['id']
    feedback=request.form['feedback']
    cmd.execute("insert into feedback values(null,'"+str(id)+"','"+feedback+"',curdate())")
    con.commit()
    return jsonify({'task': "success"})
@app.route('/sendcomplaint',methods=['get','post'])
def sendcomplaint():
    id=request.form['id']
    complaint=request.form['complaint']
    cmd.execute("insert into complaint values(null,'"+str(id)+"','"+complaint+"',curdate(),'pending')")
    con.commit()
    return jsonify({'task': "success"})
@app.route('/viewvacency',methods=['GET','POST'])
def viewvacency():
    con = pymysql.connect(host='localhost', port=3306, user='root', password='', db='onedayjobs')
    cmd = con.cursor()
    cmd.execute("SELECT `vacency`.*,`company`.`companyname` FROM `company` JOIN `vacency` ON `vacency`.`companyid`=`company`.`lid`")
    s=cmd.fetchall();
    print(s)
    row_headers=[x[0] for x in cmd.description]
    json_data=[]
    for result in s:
        json_data.append(dict(zip(row_headers,result)))
    print(jsonify(json_data))
    return jsonify(json_data)

@app.route('/viewjobstatus',methods=['GET','POST'])
def viewjobstatus():
    id = request.form['id']

    cmd.execute("SELECT `company`.`companyname`,`vacency`.`post`,`numberofvacency`,`applyvacency`.`status` FROM `vacency` JOIN `applyvacency` ON `applyvacency`.`vacencyid`=`vacency`.`id` JOIN `company` ON `company`.`lid`=`vacency`.`companyid`   WHERE `applyvacency`.`userid`='"+str(id)+"'")
    s=cmd.fetchall()
    print(s)
    row_headers=[x[0] for x in cmd.description]
    json_data=[]
    for result in s:
        json_data.append(dict(zip(row_headers,result)))
    print(jsonify(json_data))
    return jsonify(json_data)
@app.route('/applyvacency',methods=['get','post'])
def applyvacency():
    vid=request.form['vid']
    uid = request.form['uid']
    cmd.execute("insert into applyvacency values(null,'"+str(vid)+"','"+str(uid)+"',curdate(),'pending')")
    con.commit()
    return jsonify({'task': "success"})
@app.route('/viewinterviewdate',methods=['GET','POST'])
def viewinterviewdate():
    uid = request.form['uid']
    print("uid====",uid)
    cmd.execute("SELECT `interview`.*,`company`.`companyname`,`vacency`.`post` FROM `company` JOIN `interview` ON `interview`.`companyid`=`company`.`lid` JOIN `applyvacency` ON `applyvacency`.`vacencyid`=`interview`.`vacencyid` join `vacency` on `applyvacency`.`vacencyid`=`vacency`.`id` WHERE applyvacency.status='accepted' AND applyvacency.`userid`='"+uid+"'")
    s=cmd.fetchall();

    row_headers=[x[0] for x in cmd.description]
    json_data=[]
    for result in s:
        json_data.append(dict(zip(row_headers,result)))
    print(json_data)
    return jsonify(json_data)
@app.route('/viewreply',methods=['GET','POST'])
def viewreply():
    uid = request.form['uid']
    cmd.execute("SELECT * FROM `complaint` WHERE `userid`='"+uid+"'")
    s=cmd.fetchall()
    print(s)
    row_headers=[x[0] for x in cmd.description]
    json_data=[]
    for result in s:
        json_data.append(dict(zip(row_headers,result)))
    print(json_data)
    return jsonify(json_data)



if __name__=='__main__':
    app.run(host='0.0.0.0',port=5000)

