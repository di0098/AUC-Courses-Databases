# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class uniquelink(scrapy.Item):
    # define the fields for your item here like:
    url = scrapy.Field()
    # name = scrapy.Field()
    pass


class Course(scrapy.Item):
    # define the fields for your item here like:
    Fk_DeptCode = scrapy.Field()
    CCode = scrapy.Field()
    Name = scrapy.Field()
    CreditNo = scrapy.Field()
    Description=scrapy.Field()
    cross_listed=scrapy.Field()
    notes=scrapy.Field()
    offered=scrapy.Field()
    Prerequisites=scrapy.Field()
    isconcurrent=scrapy.Field(())


    # name = scrapy.Field()
    pass
