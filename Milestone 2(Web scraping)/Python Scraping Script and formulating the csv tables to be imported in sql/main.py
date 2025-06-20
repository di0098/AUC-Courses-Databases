#populating all tables in csv format using the info scraped by courses.py and csv called final2.csv


from csv import DictReader
import pandas as pd
import numpy as np
import re

input_file = list ( DictReader(open("D:/old data/desktop/University/Fall 2020/Database/Project/Milestone 2/aucCatalog/final3.csv",encoding='utf-8')) )

#prerequisites
Fk_CourseDept=list()
Fk_CourseNo=list()
Fk_PreCourseDept=list()
Fk_PreCourseNo=list()
IsConcurrent=list()

#crosslisting
Fk_Course1Dept=list()
Fk_Course1No=list()
Fk_Course2Dept=list()
Fk_Course2No=list()

#department
Dcode=list()

#coursessemesteroffered
Fks_CourseDept=list()
Fks_CourseNo=list()
Semester=list()



counter=0

for x in input_file:
    print(counter)
    #filling the department
    if( x['Fk_DeptCode'] not in Dcode ):
        Dcode.append(x['Fk_DeptCode'])
        # print('this is d code',Dcode)


    #filling the prerequisties
    pres = re.findall(r'[A-Z]{3,4} [0-9]{4}', x['Prerequisites'])
    if (len(pres)>0):
        for a in pres:
            Fk_CourseDeptt = x['Fk_DeptCode']
            Fk_CourseNoo = x['CCode']
            aS=a.split(' ')
            print(aS)
            Fk_PreCourseDeptt = aS[0]
            Fk_PreCourseNoo = aS[1]
            # IsConcurrentt = list()

            Fk_CourseDept.append(Fk_CourseDeptt)
            Fk_CourseNo.append(Fk_CourseNoo)
            Fk_PreCourseDept.append(Fk_PreCourseDeptt)
            Fk_PreCourseNo.append(Fk_PreCourseNoo)

        isc = re.findall(r'[0-1]{1}', str(x['isconcurrent']))
        # print(isc)
        for r in isc:
            if (r=='0'):
                IsConcurrentt=0
                IsConcurrent.append(IsConcurrentt)
            elif (r=='1'):
                IsConcurrentt=1
                IsConcurrent.append(IsConcurrentt)


    #filling cross-listing
    cross = re.findall(r'[A-Z]{3,4} [0-9]{4}', x['cross_listed'])
    if(len(cross)>0):
        for b in cross:
            Fk_Course1Deptt = x['Fk_DeptCode']
            Fk_Course1Noo = x['CCode']
            cS = b.split(' ')

            Fk_Course2Deptt = cS[0]
            Fk_Course2Noo = cS[1]

            Fk_Course1Dept.append(Fk_Course1Deptt)
            Fk_Course1No.append(Fk_Course1Noo)
            Fk_Course2Dept.append(Fk_Course2Deptt)
            Fk_Course2No.append(Fk_Course2Noo)

    #filling semester offered
    if(  'Fall' in x['offered'] and 'Spring' in x['offered']):
        Fks_CourseDeptt = x['Fk_DeptCode']
        Fks_CourseNoo = x['CCode']
        Semesterr = 'Fall'
        Fks_CourseDept.append(Fks_CourseDeptt)
        Fks_CourseNo.append(Fks_CourseNoo)
        Semester.append(Semesterr)
        Fks_CourseDeptt = x['Fk_DeptCode']
        Fks_CourseNoo = x['CCode']
        Semesterr = 'Spring'
        Fks_CourseDept.append(Fks_CourseDeptt)
        Fks_CourseNo.append(Fks_CourseNoo)
        Semester.append(Semesterr)

    elif ('Fall' in x['offered']):
        Fks_CourseDeptt = x['Fk_DeptCode']
        Fks_CourseNoo = x['CCode']
        Semesterr = 'Fall'
        Fks_CourseDept.append(Fks_CourseDeptt)
        Fks_CourseNo.append(Fks_CourseNoo)
        Semester.append(Semesterr)

    elif ('Spring' in x['offered']):
        Fks_CourseDeptt = x['Fk_DeptCode']
        Fks_CourseNoo = x['CCode']
        Semesterr = 'Spring'
        Fks_CourseDept.append(Fks_CourseDeptt)
        Fks_CourseNo.append(Fks_CourseNoo)
        Semester.append(Semesterr)

    else:
        Fks_CourseDeptt = x['Fk_DeptCode']
        Fks_CourseNoo = x['CCode']
        Semesterr = 'NA'
        Fks_CourseDept.append(Fks_CourseDeptt)
        Fks_CourseNo.append(Fks_CourseNoo)
        Semester.append(Semesterr)













    counter+=1





datapre={'Fk_CourseDept': Fk_CourseDept,
'Fk_CourseNo':Fk_CourseNo,
'Fk_PreCourseDept':Fk_PreCourseDept,
'Fk_PreCourseNo':Fk_PreCourseNo,
'IsConcurrent' :IsConcurrent}



datapref = pd.DataFrame(datapre,columns=['Fk_CourseDept','Fk_CourseNo','Fk_PreCourseDept','Fk_PreCourseNo','IsConcurrent'])
print(datapref)



datapref.to_csv("prerequisties.csv",index=False)


datacross = {
'Fk_Course1Dept':Fk_Course1Dept,
'Fk_Course1No':Fk_Course1No,
'Fk_Course2Dept':Fk_Course2Dept,
'Fk_Course2No':Fk_Course2No

}

datacrossf= pd.DataFrame(datacross,columns=['Fk_Course1Dept', 'Fk_Course1No','Fk_Course2Dept' ,'Fk_Course2No'])


datacrossf.to_csv("crosslisting.csv",index=False)




datadept={
'Dcode':Dcode

}

datadeptf=pd.DataFrame(datadept, columns=['Dcode'])

datadeptf.to_csv("departments.csv",index=False)



#coursessemesteroffered
datasem={
'Fks_CourseDept':Fks_CourseDept,
'Fks_CourseNo':Fks_CourseNo,
'Semester' : Semester
}

datasemf =pd.DataFrame(datasem,columns=['Fks_CourseDept','Fks_CourseNo','Semester'])


datasemf.to_csv("offered.csv",index=False)






