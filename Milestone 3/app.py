from flask import Flask,request,render_template
from flaskext.mysql import MySQL

mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER']="user_101"
app.config['MYSQL_DATABASE_PASSWORD']=""
app.config['MYSQL_DATABASE_DB']="auccatalogg"
app.config['MYSQL_DATABASE_HOST']="db4free.net"
app.config['MYSQL_DATABASE_PORT']=3306
mysql.init_app(app)




@app.route('/')
def my_form():
    return render_template('base.html')

@app.route('/addstudent')
def my_form1():
    return render_template('addstudent.html')

@app.route('/addreview')
def my_form2():
    return render_template('addreview.html')

@app.route('/viewreview')
def my_form3():
    return render_template('viewreview.html')

@app.route('/coursesavai')
def my_form4():
    return render_template('coursesavai.html')

@app.route('/addcoursescompleted')
def my_form5():
    return render_template('addcoursescompleted.html')

@app.route('/viewcourse')
def my_form6():
    return render_template('viewcourse.html')




@app.route('/addstudent',methods=['POST'])
def AddStudent():
    StudentID =request.form['ID']
    FName=request.form['Fname']
    print(StudentID)
    LName = request.form['Lname']

    Classtand=request.form['CStand']
    major = request.form['DeptCode']
    major = major.split(" ")
    conn = mysql.connect()
    cursor = conn.cursor()
    print(major)

    # error handling if department entered doesnt exist
    for x in major:
        cursor.execute("Select Dcode from auccatalogg.department where Dcode='"+x+"'")
        data=cursor.fetchall()
        if(len(data)==0):
            return "Department code entered does not exist. Kindly make sure the code is correct"




    cursor.execute(
        "select ID from auccatalogg.aucstudent where auccatalogg.aucstudent.ID='" + StudentID + "'")
    data=cursor.fetchall()
    if(len(data)>0):
        return "A student with the same ID already exists"



    cursor.execute("INSERT INTO auccatalogg.aucstudent VALUES ( '" + StudentID + "' , '" + FName+"', '"+LName+"' , '"+Classtand+"');")
    conn.commit()
    for x in major:
        # print(x)
        cursor.execute("INSERT INTO auccatalogg.studentdepart VALUES ( '" + StudentID + "' ,'" + x + "' );")
        conn.commit()



        return "Student Successfully Added"





@app.route('/addreview', methods=['POST'])
def addreview():
    StudentID = request.form['ID']
    Ccode = request.form['Ccode']

    rating = request.form['rating']

    comment = request.form['comment']
    semester = request.form['semester']
    conn = mysql.connect()
    cursor = conn.cursor()
    if " " not in Ccode:
        return "Invalid Course Number Format"
    else:
        Ccode= Ccode.split(" ")
        Cdept = Ccode[0]
        Cnumber=Ccode[1]
        cursor.execute("select CCode from auccatalogg.course where auccatalogg.course.CCode = '"+ Cnumber+"' and auccatalogg.course.Fk_DeptCode= '"+ Cdept +"'")
        data=cursor.fetchall()
        #error handling if course or student entered not existing in dataset
        if len(data)==0:
            return "Course does not exist. Kindly make sure the code is correct"

        cursor.execute("select ID from auccatalogg.aucstudent where auccatalogg.aucstudent.ID = '" + StudentID  + "'")
        data = cursor.fetchall()

        if( len(data)==0):
            return "Student does not exist in database"

        if( int(rating) > 5 or int(rating)<0 ):
            return "Invalid Value for rating"

        # error handling if the review is being done to the same course more than once by the same student
        cursor.execute("select rating from auccatalogg.studentreviewcourse where auccatalogg.studentreviewcourse.Fkr_studentId='" + StudentID+"' and Fkr_CourseDept='"+Cdept+"' and Fkr_CourseNo='"+Cnumber+"'")
        data=cursor.fetchall()
        if(len(data)>0):
            return"There is already a review that exists for this course by you"

        cursor.execute("INSERT INTO auccatalogg.studentreviewcourse VALUES ( '" + StudentID + "' , '" + Cdept + "', '" + Cnumber + "' , '" + rating + "', '"+comment+"' , '"+semester+"')")
        conn.commit()
        return "Review successfully added"





@app.route('/viewreview', methods=['POST'])
def viewreview():

    Ccode = request.form['Ccode']


    conn = mysql.connect()
    cursor = conn.cursor()
    if " " not in Ccode:
        return "Invalid Course Number Format"
    else:
        Ccode= Ccode.split(" ")
        Cdept = Ccode[0]
        Cnumber=Ccode[1]
        cursor.execute("select CCode from auccatalogg.course where auccatalogg.course.CCode = '"+ Cnumber+"' and auccatalogg.course.Fk_DeptCode= '"+ Cdept +"'")
        data=cursor.fetchall()
        #error handling if course or student entered not existing in dataset
        if len(data)==0:
            return "Course does not exist. Kindly make sure the code is correct"


        cursor.execute("select auccatalogg.aucstudent.FName ,auccatalogg.aucstudent.LName , auccatalogg.studentreviewcourse.Fkr_CourseDept ,auccatalogg.studentreviewcourse.Fkr_CourseNo ,auccatalogg.studentreviewcourse.rating,auccatalogg.studentreviewcourse.TextualReview,auccatalogg.studentreviewcourse.Semester,not ( (auccatalogg.studentcoursescompleted.Fkc_CourseDept <> '"+Cdept+"' and auccatalogg.studentcoursescompleted.Fkc_CourseNo <> '"+Cnumber+"') or (auccatalogg.studentcoursescompleted.Fkc_CourseDept is  NULL and auccatalogg.studentcoursescompleted.Fkc_CourseNo  is  NULL) ) as verified from auccatalogg.studentreviewcourse left outer join auccatalogg.studentcoursescompleted on auccatalogg.studentreviewcourse.Fkr_CourseDept=auccatalogg.studentcoursescompleted.Fkc_CourseDept AND auccatalogg.studentreviewcourse.Fkr_CourseNo=auccatalogg.studentcoursescompleted.Fkc_CourseNo AND auccatalogg.studentreviewcourse.Fkr_studentId=auccatalogg.studentcoursescompleted.Fkc_studentID inner join  auccatalogg.aucstudent on auccatalogg.studentreviewcourse.Fkr_studentID=auccatalogg.aucstudent.ID where auccatalogg.studentreviewcourse.Fkr_CourseDept= '"+Cdept+"' and auccatalogg.studentreviewcourse.Fkr_CourseNo='"+Cnumber+"'")
        data=cursor.fetchall()
        print(data)
        return render_template('viewreview.html', data=data)





@app.route('/coursesavai', methods=['POST'])
def coursesavai():

    StudentID = request.form['ID']
    Semester = request.form['semester']


    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute("select ID from auccatalogg.aucstudent where auccatalogg.aucstudent.ID = '" + StudentID + "'")
    data = cursor.fetchall()
    if (len(data) == 0):
        return "Student does not exist in database"


    cursor.execute(" select course.Fk_DeptCode,course.CCode, course.Name from auccatalogg.course Inner join auccatalogg.coursesemesteroffered on course.Fk_DeptCode=coursesemesteroffered.Fks_CourseDept and course.CCode=coursesemesteroffered.Fks_CourseNo Left outer join auccatalogg.courseprereq on course.Fk_DeptCode=courseprereq.Fk_CourseDept and course.CCode=courseprereq.Fk_CourseNo where courseprereq.Fk_CourseNo is NULL and  ( coursesemesteroffered.Semester='"+Semester+"' or coursesemesteroffered.Semester='NA')")
    data1=cursor.fetchall()



    cursor.execute("create view auccatalogg.pre1 as select course.CCode as pref1Code,course.Fk_DeptCode as pref1Depart,course.Name as pref1Name from auccatalogg.course inner join auccatalogg.coursesemesteroffered on course.CCode = coursesemesteroffered.Fks_CourseNo AND course.Fk_DeptCode=coursesemesteroffered.Fks_CourseDept inner join auccatalogg.courseprereq on course.Fk_DeptCode = courseprereq.Fk_CourseDept AND  course.CCode = courseprereq.Fk_CourseNo inner join auccatalogg.studentcoursescompleted on courseprereq.Fk_PreCourseDept=studentcoursescompleted.Fkc_CourseDept AND courseprereq.Fk_PreCourseNo=studentcoursescompleted.Fkc_CourseNo AND studentcoursescompleted.Fkc_studentID='"+StudentID+"'  where coursesemesteroffered.Semester='"+Semester+"' or coursesemesteroffered.Semester='NA'")
    cursor.execute( "create view auccatalogg.pre2 as select course.CCode as pref2code ,course.Fk_DeptCode as pref2Depart,course.Name as pref2Name from auccatalogg.course inner join auccatalogg.coursesemesteroffered on  course.CCode = coursesemesteroffered.Fks_CourseNo AND course.Fk_DeptCode=coursesemesteroffered.Fks_CourseDept inner join auccatalogg.courseprereq on course.Fk_DeptCode = courseprereq.Fk_CourseDept AND  course.CCode = courseprereq.Fk_CourseNo Left OUTER join auccatalogg.studentcoursescompleted on courseprereq.Fk_PreCourseDept=studentcoursescompleted.Fkc_CourseDept AND courseprereq.Fk_PreCourseNo=studentcoursescompleted.Fkc_CourseNo AND studentcoursescompleted.Fkc_studentID='"+StudentID+ "' where Fkc_CourseDept is Null and Fkc_CourseNo is NULL and coursesemesteroffered.Semester='"+Semester+"' or coursesemesteroffered.Semester='NA'")
    cursor.execute("select pref1Depart, pref1Code,pref1Name  from auccatalogg.pre1 left outer join auccatalogg.pre2 on pref1Code = pref2Code AND pref1Depart = pref2Depart where pref2code is NULL and pref2Depart is NULL")
    data2=cursor.fetchall()
    data=data1+data2
    cursor.execute("drop view auccatalogg.pre1")
    cursor.execute("drop view auccatalogg.pre2")



    return render_template('coursesavai.html', data=data)






@app.route('/addcoursescompleted', methods=['POST'])
def addcoursescompleted():
    StudentID = request.form['ID']
    Ccode = request.form['Ccode']

    grade = request.form['grade']

    Semester = request.form['Semester']
    year = request.form['year']
    conn = mysql.connect()
    cursor = conn.cursor()
    if " " not in Ccode:
        return "Invalid Course Number Format"
    else:
        Ccode= Ccode.split(" ")
        Cdept = Ccode[0]
        Cnumber=Ccode[1]
        cursor.execute("select CCode from auccatalogg.course where auccatalogg.course.CCode = '"+ Cnumber+"' and auccatalogg.course.Fk_DeptCode= '"+ Cdept +"'")
        data=cursor.fetchall()
        #error handling if course or student entered not existing in dataset
        if len(data)==0:
            return "Course does not exist. Kindly make sure the code is correct"

        cursor.execute("select ID from auccatalogg.aucstudent where auccatalogg.aucstudent.ID = '" + StudentID  + "'")
        data = cursor.fetchall()

        if( len(data)==0):
            return "Student does not exist in database"



        # error handling if course already exists
        cursor.execute("select grade from auccatalogg.studentcoursescompleted where auccatalogg.studentcoursescompleted.Fkc_studentId='" + StudentID+"' and Fkc_CourseDept='"+Cdept+"' and Fkc_CourseNo='"+Cnumber+"'")
        data=cursor.fetchall()
        if(len(data)>0):
            return"You already completed this course"

        cursor.execute("INSERT INTO auccatalogg.studentcoursescompleted VALUES ( '" + StudentID + "' , '" + Cdept + "', '" + Cnumber + "' , '" + grade + "', '"+Semester+"' , '"+year+"')")
        conn.commit()
        return "Course added successfully"




@app.route('/viewcourse', methods=['POST'])
def viewcourse():

    Ccode = request.form['Ccode']


    conn = mysql.connect()
    cursor = conn.cursor()
    if " " not in Ccode:
        return "Invalid Course Number Format"
    else:
        Ccode= Ccode.split(" ")
        Cdept = Ccode[0]
        Cnumber=Ccode[1]
        cursor.execute("select CCode from auccatalogg.course where auccatalogg.course.CCode = '"+ Cnumber+"' and auccatalogg.course.Fk_DeptCode= '"+ Cdept +"'")
        data=cursor.fetchall()
        #error handling if course or student entered not existing in dataset
        if len(data)==0:
            return "Course does not exist. Kindly make sure the code is correct"



        cursor.execute("select course.Name, course.CreditNo, course.Description, course.Notes,coursesemesteroffered.Semester, courseprereq.Fk_PreCourseDept,courseprereq.Fk_PreCourseNo,courseprereq.IsConcurret,crosscourseslisted.Fk_Course2Dept,crosscourseslisted.Fk_Course2No from auccatalogg.course  left outer  join auccatalogg.courseprereq on course.CCode=courseprereq.Fk_CourseNo and course.Fk_DeptCode=courseprereq.Fk_CourseDept left outer  join auccatalogg.crosscourseslisted on  course.CCode=crosscourseslisted.Fk_Course1No and course.Fk_DeptCode=crosscourseslisted.Fk_Course1Dept inner join auccatalogg.coursesemesteroffered on course.CCode=coursesemesteroffered.Fks_CourseNo and course.Fk_DeptCode=coursesemesteroffered.Fks_CourseDept where course.CCode='"+Cnumber+"' and course.Fk_DeptCode='"+Cdept+"'")
        data=cursor.fetchall()
        print(data)
        return render_template('viewcourse.html', data=data)





if __name__=="__main__":
    app.run()



