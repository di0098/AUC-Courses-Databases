import scrapy
from ..items import Course
from csv import DictReader
import re

def remove_html_markup(s):
    tag = False
    quote = False
    out = ""

    for c in s:
            if c == '<' and not quote:
                tag = True
            elif c == '>' and not quote:
                tag = False
            elif (c == '"' or c == "'") and tag:
                quote = not quote
            elif not tag:
                out = out + c

    return out






class aucCoursesSpider (scrapy.Spider):
    name = 'courses'
    urls=[]
    counter=1
    input_file = list( DictReader(open("D:/old data/desktop/University/Fall 2020/Database/Project/Milestone 2/aucCatalog/urls.csv")))
    x = str(input_file[int(counter-1)])
    x = x.replace("_nopop", "")
    x=x[9:]
    print('xis' ,x)

    start_urls = [
        'http://catalog.aucegypt.edu/'+x

     ]
    # start_urls=[
    #         'http://catalog.aucegypt.edu/preview_course.php?catoid=36&coid=83395'
    # ]

    def parse(self,response):
        items = Course()
        coursedetails = response.css('.block_content_popup')
        #getting deptcode,coursecode,name,credithours
        codename = coursedetails.css('#course_preview_title::text').extract()
        codename=str(codename)
        print('coursedetails',codename)

        #getting deptcode
        partioned = codename.partition(' ')
        print('partioned string',partioned)
        deptcode =codename.partition(' ')[0]
        deptcode = deptcode[2:]
        print('dept code',deptcode)
        print('this is code',deptcode)
        if('/'in str(deptcode)):
            rr = deptcode.index('/')
            deptcode=deptcode[0: rr]
            items['Fk_DeptCode'] = deptcode
            coursecodee= re.findall(r'[0-9]{4}',str(partioned))
            print('coursecode',coursecodee)
            coursecode=coursecodee[0]
            items['CCode'] = coursecode



        else:
            items['Fk_DeptCode']=deptcode

            #getting coursecode
            ind= codename.index('/')+1
            print('ind',ind)
            end= ind+4
            print('end', end)
            coursecode= codename[ind:end]
            print('coursecode',coursecode)
            items['CCode']=coursecode

        #getting course name

        ind = codename.index('-')
        print('ind', ind)
        if '(' in codename:
            end = codename.index('(')
            print('end', end)
            coursename = codename[ind + 3:end-1]
            items['Name'] = coursename


        else:
            end = codename.index(']')
            print('end', end)
            coursename = codename[ind + 3:end - 2]
            items['Name'] = coursename
            items['CreditNo'] = "0 cr."



        if '('in codename:
            #getting creditHours
            ind = codename.index('(')
            print('ind', ind)
            end = codename.index(')')
            print('end', end)
            creditHour = codename[ind + 1 :end]
            print('credithour', creditHour)

            items['CreditNo'] = str(creditHour)




        pres=[]
        # getting prerequisities
        strongs = coursedetails.css('strong::text').getall()
        print('cd', strongs)
        #getting prerequistes
        if 'Prerequisites' in strongs:
            pre= response.xpath('//body').extract()
            precleaned = remove_html_markup(pre)
            ind = precleaned.index('Prerequisites')
            end=precleaned.find('Cross-listed')
            if(end==-1):
                print('it is -1')
                end=len(precleaned)-1
                print('new end',end)
            pres = re.findall(r'[A-Z]{3,4} [0-9]{4}', precleaned[ind:end])
            print('pres ' ,pres)
            items['Prerequisites']=str(pres)
            print(str(pres))
            # print (' pres callable',pres[0])

            if(len(pres)>0):
                sub_string="concurrent"
                res=[]
                for i in range(0, len(precleaned)):
                    k = i
                    flag = 0
                    for j in range(0, len(sub_string)):
                        if precleaned[k] != sub_string[j]:
                            flag = 1
                        if flag:
                            break
                        k = k + 1
                    if flag == 0:
                        res.append(i)

                print('concurrent indices',res)
                isConS=""
                for g in range (0,len(pres)):
                    isCon=0
                    for h in range (0,len(res)):
                        if(g==0):
                            if ( res[h]< precleaned.find(str(pres[g])) ):
                                isCon=1
                        else:
                            if ( res[h]< precleaned.find(str(pres[g])) and res[h]> precleaned.find(str(pres[g-1])) ):
                                isCon=1


                    if(g!=0):
                        if (isCon==1 ):
                             isConS=isConS+','+'1'
                        else:
                             isConS = isConS + ',' + '0'
                        print('isConS',isConS)
                        items['isconcurrent']=isConS

                    else:
                        if (isCon==1 ):
                             isConS=isConS+'1'
                        else:
                             isConS = isConS  + '0'
                        print('isConS',isConS)
                        items['isconcurrent']=isConS




        else:
            pre=" "
            items['Prerequisites']=pre
            items['isconcurrent']=" "


        #getting desciption
        if 'Description' in strongs:
            desc = response.xpath('//td[@class="block_content_popup"]/strong[contains(text(),"Description")]/following-sibling::text()[1]').extract()

            print('f',str(desc))
            # descc= desc.xpath('//br/following-sibling').extract()
            items['Description']= str(desc)[   2: len(str(desc)) -3]
            print('desc',desc)

        else:
            desc =" "
            items['Description']=desc

            #getting notes

        if 'Notes' in strongs:
            note = response.xpath( '//td[@class="block_content_popup"]/strong[contains(text(),"Notes")]/following-sibling::text()[1]').extract()
            items['notes']=str(note) [ 2:  len(str(note))-3  ]
            print('notes' ,note)

        else:
            note=" "
            items['notes']=note

            #getting cross-listing

        if 'Cross-listed' in strongs:


                # cross = response.xpath('//td[@class="block_content_popup"]/strong[contains(text(),"Cross-listed")]/following-sibling::text()').extract()
                # print ('sereis if strings',cross)
                # if 'and' in str(cross):
                #     cross1=response.css('br+ a::text').extract()
                #     print('cross 1',cross)
                #     cross2= response.css('span+a::text').extract()
                #     print('cross2',cross2)
                #     cross=str(cross1)+','+str(cross2)
                #     print('concatenated',cross)
                #     items['cross_listed'] = str(cross)
                #     print('cross', cross)
                #
                #
                # else:
                #
                #     cross = response.xpath('//div[(((count(preceding-sibling::*) + 1) = 19) and parent::*)]//a/text()').extract()
                #
                #     print('cross listed', str(cross))
                #     # descc= desc.xpath('//br/following-sibling').extract()
                #     counter =0
                #     for char in str(cross):
                #        if (char.isdigit()):
                #            counter+=1
                #
                #     if counter!=4:
                #         cross = response.css('br+ div a::text').extract()
                #
                #     items['cross_listed'] = str(cross)
                #     print('cross', cross)

                cross = response.xpath( '//div[(((count(preceding-sibling::*) + 1) = 19) and parent::*)]//a/text()').extract()



                print('cross listed', str(cross))
                # descc= desc.xpath('//br/following-sibling').extract()
                inPre=0
                for l in pres:
                    if(str(l) in str(cross)):
                        inPre=1
                if (inPre==1):
                    cross=[]
                counter = 0
                for char in str(cross):
                    if (char.isdigit()):
                        counter += 1

                if counter != 4:
                        cross = response.css('br+ div a::text').extract()
                        inPre = 0
                        for l in pres:
                            if (str(l) in str(cross)):
                                inPre = 1
                        if (inPre == 1):
                            cross = []

                        for char in str(cross):
                            if (char.isdigit()):
                                counter += 1
                        if counter != 4:
                            cross1 = response.css('br+ a::text').extract()
                            print('cross 1', cross)
                            inPre = 0
                            for l in pres:
                                if (str(l) in str(cross1)):
                                    inPre = 1
                            if (inPre == 1):
                                cross1 = []

                            cross2 = response.css('span+a::text').extract()
                            print('cross2', cross2)
                            inPre = 0
                            for l in pres:
                                if (str(l) in str(cross2)):
                                    inPre = 1
                            if (inPre == 1):
                                cross2 = []
                            crosscon = str(cross1) + ',' + str(cross2)
                            print('concatenated', crosscon)
                            items['cross_listed'] = str(crosscon)
                            print('cross', crosscon)
                            for char in str(crosscon):
                                if (char.isdigit()):
                                    counter += 1
                            if counter < 4 :
                                cross = response.xpath('//div[(((count(preceding-sibling::*) + 1) = 11) and parent::*)]//a/text()').extract()
                                inPre = 0
                                for l in pres:
                                    if (str(l) in str(cross)):
                                        inPre = 1
                                if (inPre == 1):
                                    cross = []
                                for char in str(cross):
                                    if (char.isdigit()):
                                        counter += 1
                                if counter<4:
                                    cross=" "


                items['cross_listed'] = str(cross)
                print('cross', cross)


        else:
            cross=" "
            items['cross_listed'] = cross
            print('cross', cross)



        if 'When Offered' in strongs:
            #extracting when offered
            sem = response.xpath('//td[@class="block_content_popup"]/strong[contains(text(),"When Offered")]/following-sibling::text()[1]').extract()
            print("sem",sem)
            sems="NA"
            if( 'fall' in str(sem) and 'spring' in str(sem)):
                sems="Fall,Spring"
            elif ('fall' in str(sem)):
                sems="Fall"
            elif ('spring' in str(sem)):
                sems="Spring"
            items['offered']=sems

        else:
            sems= "NA"
            items['offered']=sems













        # strong[contains(text(), "Descrition")] / following - sibling::text()[1]
        # ')









        yield items

        s = str(aucCoursesSpider.input_file[aucCoursesSpider.counter]["url"])
        s = s.replace("_nopop", "")


        print('s is', s)

        nextpage = 'http://catalog.aucegypt.edu/' + s



        if aucCoursesSpider.counter<2429:

             aucCoursesSpider.counter += 1
             yield response.follow(nextpage, callback=self.parse)



