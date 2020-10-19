import pymysql
from flask import *
app=Flask(__name__)
con=pymysql.connect(host='localhost',port=3306,user='root',password='',db='onedayjobs')
cmd=con.cursor()
app.secret_key="2035"
@app.route('/')
def main():
    session.clear()
    return render_template('login.html')
@app.route('/companyhome')
def companyhome():
    return render_template('Companyhomepage.html')
@app.route('/companyeditvacency')
def companyeditvacency():
    if 'id' in session:
        id = request.args.get('id')
        print(id)
        session['vid'] = id

        cmd.execute("SELECT * FROM vacency WHERE id='" + id + "' ")
        s = cmd.fetchone()
        print(s)
        return render_template('companyeditvacency.html', val=s)
    else:
        return render_template('login.html')
@app.route('/companydeletevacency')
def companydeletevacency():
    if 'id' in session:
        id = request.args.get('id')
        print(id)
        cmd.execute("delete FROM vacency WHERE id='" + id + "' ")
        con.commit()
        return '''<script>alert("deleted");window.location="companyviewvacency"</script>'''
    else:
        return render_template('login.html')
@app.route('/companyviewvacency')
def companyviewvacency():
    if 'id' in session:
        cmd.execute("SELECT * FROM `vacency` WHERE `companyid`='" + str(session['id']) + "'")
        s = cmd.fetchall()
        print(s)
        return render_template('companyviewvacency.html', val=s)
    else:
        return render_template('login.html')
@app.route('/addinterviewdate')
def addinterviewdate():
    if 'id' in session:
        cmd.execute("select id,post from vacency where companyid='" + str(session['id']) + "'")
        s = cmd.fetchall()
        return render_template('addinterviewdate.html', val=s)
    else:
        return render_template('login.html')
@app.route('/adminhome')
def adminhome():
    if 'aid' in session:
        return render_template('adminhome.html')
    else:
        return render_template('login.html')


@app.route('/adminreplay')
def adminreplay():
    if 'aid' in session:
      return render_template('adminrepaly.html')
    else:
      return render_template('login.html')
@app.route('/adminviewcomplaint')
def adminviewcomplaint():
    if 'aid' in session:
      return render_template('adminviewcomplaint.html')
    else:
      return render_template('login.html')
@app.route('/adminviewfeedback')
def adminviewfeedback():
    if 'aid' in session:
       return render_template('adminviewfeedback.html')
    else:
       return render_template('login.html')
@app.route('/adminviewfeedback1',methods=['get','post'])
def adminviewfeedback1():
    if 'aid' in session:
        type = request.form['select']
        print(type)
        if type == "user":
            cmd.execute(
                "SELECT user.name,feedback.feedback,feedback.date FROM USER JOIN login ON user.`userid`=login.id JOIN feedback ON feedback.usertype_id=login.id")
            s = cmd.fetchall()
            return render_template('adminviewfeedback.html', val=s)
        else:
            cmd.execute(
                "SELECT company.companyname,feedback.feedback,feedback.date FROM `company` JOIN login ON `company`.`lid`=login.id JOIN feedback ON feedback.usertype_id=login.id")
            s = cmd.fetchall()
            return render_template('adminviewfeedbacks.html', val=s)
    else:
        return render_template('login.html')
@app.route('/adminviewvacency')
def adminviewvacency():
    if 'aid' in session:
      return render_template('adminviewvacency.html')
    else:
      return render_template('login.html')
@app.route('/approvecompany')
def approvecompany():
    if 'aid' in session:
        cmd.execute("select company.* from company join login on company.lid=login.id where login.usertype='pending'")
        s = cmd.fetchall()
        print(s)
        return render_template('Approvecompany.html', val=s)
    else:
        return render_template('login.html')

@app.route('/companyaddvacency')
def companyaddvacency():
    if 'id' in session:
        return render_template('companyaddvacency.html')
    else:
        return render_template('login.html')
@app.route('/companyreg')
def comanyreg():
    return render_template('Companyregistration.html')
@app.route('/companycomplaint')
def companycomplaint():
    if 'id' in session:
        return render_template('companysendcomplaint.html')
    else:
        return render_template('login.html.html')
@app.route('/companyfeedback')
def companyfeedback():
    if 'id' in session:
        return render_template('companysendfeedback.html')
    else:
        return render_template('login.html')
@app.route('/companyresume')
def companyresume():
    if 'id' in session:
        id = session['id']
        cmd.execute(
            "select `user`.*,`applyvacency`.`id`,`vacency`.`post` from `applyvacency` join `user` on `user`.`userid`=`applyvacency`.`userid` join `vacency` on `vacency`.`id`=`applyvacency`.`vacencyid` where `applyvacency`.`status`='pending' and `vacency`.`companyid`='" + str(
                id) + "'")
        b = cmd.fetchall()
        print(b)
        return render_template('companyviewresume.html', val=b)
    else:
        return render_template('login.html')
@app.route('/adminviewresume')
def adminviewresume():
    if 'aid' in session:
        cmd.execute("select * from user")
        c = cmd.fetchall()
        print(c)
        return render_template('adminviewresume.html', val=c)
    else:
        return render_template('login.html')
@app.route('/comupdate')
def comupdate():
    if 'id' in session:
        id = session['id']
        cmd.execute("select * from company where lid='" + str(id) + "'")
        a = cmd.fetchone()
        return render_template('comupdate.html', val=a)
    else:
        return render_template('login.html')
@app.route('/log',methods=['get','post'])
def log():
    un=request.form['textfield']
    pw=request.form['textfield2']
    cmd.execute("select * from login where username='"+un+"'and password='"+pw+"'")
    s=cmd.fetchone()
    print(s)
    if s is None:
        return '''<script>alert("invalid username");window.location="/"</script>'''
    if s[3]=="admin":
        session['aid']=s[0]
        return'''<script>alert("succesfully logged in");window.location="/adminhome"</script>'''
    if s[3]=="company":
        session['id']=s[0]

        return '''<script>alert("succesfully logged in");window.location="/companyhome"</script>'''
    else:
        return '''<script>alert("invalid username");window.location="/"</script>'''
@app.route('/fetch',methods=['get','post'])
def fetch():
    cname=request.form['textfield']
    pin=request.form['textfield2']
    place=request.form['textfield3']
    post=request.form['textfield4']
    website=request.form['textfield9']
    email=request.form['textfield5']
    cnumber=request.form['textfield8']
    password=request.form['textfield6']
    cpassword=request.form['textfield7']
    if password==cpassword:
        cmd.execute("insert into login values(null,'"+email+"','"+password+"','pending')")
        id=con.insert_id()
        print(id)
        cmd.execute("insert into company values(null,'"+str(id)+"','"+cname+"','"+pin+"','"+place+"','"+post+"','"+website+"','"+email+"','"+cnumber+"','"+password+"')")
        con.commit()
        return '''<script>alert("successfully inserted");window.location="/"</script>'''
    else:
        return '''<script>alert("password missmatch");window.location="/"</script>'''
@app.route('/approve',methods=['get','post'])
def approve():
    id=request.args.get('id')
    print(id)
    cmd.execute("update login set usertype='company' where id='"+str(id)+"'")
    con.commit()
    return '''<script>alert("approved");window.location="/approvecompany"</script>'''
@app.route('/reject',methods=['get','post'])
def reject():
    id=request.args.get('id')
    print(id)
    cmd.execute("delete from login where id='"+str(id)+"'")
    cmd.execute("delete from company where lid='" + str(id) + "'")
    con.commit()
    return '''<script>alert("rejected");window.location="/approvecompany"</script>'''
@app.route('/fetchupdate',methods=['get','post'])
def fetchupdate():
    id=session['id']
    cname=request.form['textfield']
    pin=request.form['textfield2']
    place=request.form['textfield3']
    post=request.form['textfield4']
    website=request.form['textfield9']
    email=request.form['textfield5']
    cnumber=request.form['textfield8']
    cmd.execute("update company set companyname='"+cname+"',pin='"+pin+"',place='"+place+"',post='"+post+"',website='"+website+"',email='"+email+"',contactnumber='"+cnumber+"' where lid='"+str(id)+"'")
    cmd.execute("update login set username='"+email+"' where id='"+str(id)+"'")
    con.commit()
    return '''<script>alert("updated");window.location="/companyhome"</script>'''
@app.route('/addvacency',methods=['get','post'])
def addvacency():
    if 'id' in session:
        id = session['id']
        description = request.form['textarea']
        post = request.form['textfield']
        vacency = request.form['textfield2']
        cmd.execute("insert into vacency values(null,'" + str(
            id) + "','" + post + "','" + vacency + "',curdate(),'" + description + "')")
        con.commit()
        return '''<script>alert("updated");window.location="/companyviewvacency"</script>'''
    else:
        return render_template('login.html')

@app.route('/updatevacency',methods=['get','post'])
def updatevacency():
    if 'id' in session:
        id = session['id']
        description = request.form['textarea']
        post = request.form['textfield']
        vacency = request.form['textfield2']
        cmd.execute(
            "update vacency set post='" + post + "',numberofvacency='" + vacency + "',dates=curdate(),description='" + description + "' where id='" + str(
                session['vid']) + "'")
        con.commit()
        return '''<script>alert("updated");window.location="/companyviewvacency"</script>'''
    else:
        return render_template('login.html')
@app.route('/addinterviewdate1',methods=['get','post'])
def addinterviewdate1():
    if 'id' in session:
        id = session['id']
        post = request.form['select']
        interviewdate = request.form['textfield2']
        cmd.execute("insert into interview values(null,'" + str(id) + "','" + post + "','" + interviewdate + "')")
        con.commit()
        return '''<script>alert("added");window.location="/addinterviewdate"</script>'''
    else:
        return render_template('login.html')
@app.route('/companysendfeedback1',methods=['get','post'])
def companysendfeedback1():
    if 'id' in session:
        id = session['id']
        feedback = request.form['textarea']
        cmd.execute("insert into feedback values(null,'" + str(id) + "','" + feedback + "',curdate())")
        con.commit()
        return '''<script>alert("sended");window.location="/companyfeedback"</script>'''
    else:
        return render_template('login.html')
@app.route('/adminviewvacency1')
def adminviewvacency1():
    if 'aid' in session:
        cmd.execute(
            "SELECT `vacency`.*,`company`.`companyname` FROM `vacency` INNER JOIN `company` ON `company`.`lid`=`vacency`.`companyid`")
        b = cmd.fetchall()
        return render_template('adminviewvacency.html', val=b)
    else:
       return render_template('login.html')
@app.route('/adminviewcomplaint1')
def adminviewcomplaint1():
    if 'aid' in session:
        cmd.execute(
            "SELECT `user`.`name`,`complaint`.`complaint`,`date`,`complaint`.`id` FROM `complaint` JOIN `user` ON `complaint`.`userid`=`user`.`userid` WHERE `complaint`.`reply`='pending'")
        s = cmd.fetchall()
        return render_template('adminviewcomplaint.html', val=s)
    else:
        return render_template('login.html')
@app.route('/adminreplay1')
def adminreplay1():
    if 'aid' in session:
        id = request.args.get('id')
        session['id'] = id
        return render_template('adminrepaly.html')
    else:
        return render_template('login.html')
@app.route('/sendreply',methods=['post'])
def sendreply():
    reply=request.form['textarea']
    cmd.execute("update complaint set reply='"+reply+"' where id='"+str(session['id'])+"' ")
    con.commit()
    return  '''<script>alert("send");window.location="/adminviewcomplaint1"</script>'''
@app.route('/acceptvacency',methods=['get','post'])
def acceptvacency():
    if 'id' in session:
        id = request.args.get('id')
        print(id)
        cmd.execute("update applyvacency set status='accepted' where id='" + str(id) + "'")
        con.commit()
        return '''<script>alert("Accepted");window.location="/companyresume"</script>'''
    else:
        return render_template('login.html')
@app.route('/rejectvacency',methods=['get','post'])
def rejectvacency():
    if 'id' in session:
        id = request.args.get('id')
        print(id)
        cmd.execute("update applyvacency set status='rejected' where id='" + str(id) + "'")
        con.commit()
        return '''<script>alert("rejected");window.location="/companyresume"</script>'''
    else:
        return render_template('login.html')

if __name__=='__main__':
    app.run(debug=True)