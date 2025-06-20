import scrapy
from ..items import uniquelink

class aucCataSpider (scrapy.Spider):
    name = 'links'
    urls=[]
    pagenumber=2
    start_urls = [
        'http://catalog.aucegypt.edu/content.php?catoid=36&catoid=36&navoid=1738&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D=1#acalog_template_course_filter'

    ]



    def parse(self,response):

        items= uniquelink()
        allcoursesUrl = response.css('.width a::attr(href)').extract()

        for x in allcoursesUrl:
            items['url']=x

            yield items

        nextpage = 'http://catalog.aucegypt.edu/content.php?catoid=36&catoid=36&navoid=1738&filter%5Bitem_type%5D=3&filter%5Bonly_active%5D=1&filter%5B3%5D=1&filter%5Bcpage%5D='+str(aucCataSpider.pagenumber)+'#acalog_template_course_filter'

        if aucCataSpider.pagenumber<=25:
             aucCataSpider.pagenumber+=1
             yield response.follow(nextpage,callback=self.parse)
