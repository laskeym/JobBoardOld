import re
import requests
from lxml import html

def get_urls(site, params):
  if site == 'dice':
    page = requests.get('https://www.dice.com/jobs', params=params)
    tree = html.fromstring(page.content)
    urls = tree.xpath('//div[@class="serp-result-content"]/ul[@class="list-inline"]/li/h3/a/@href')

    urls = ['https://www.dice.com/' + url for url in urls]
  elif site == 'indeed':
    page = requests.get('https://www.indeed.com/jobs', params=params)
    tree = html.fromstring(page.content)
    urls = tree.xpath('//div[@class="  row  result"]/@data-jk | //div[@class="row  result"]/@data-jk | //div[@class="row sjlast result"]/@data-jk | //div[@class="lastRow  row  result"]/@data-jk')

    urls = ['https://www.indeed.com/viewjob?q=' + params['q'] + '&from=web&jk=' + jk for jk in urls]

  elif site == 'simplyhired':
    page = requests.get('https://www.simplyhired.com/search', params=params)
    tree = html.fromstring(page.content)
    urls = tree.xpath('//h2[@class="jobposting-title"]/a/@href')

    urls = ['https://www.simplyhired.com' + url for url in urls]

  return urls

def parse(url):
  job_contents = {}
  page = requests.get(url)
  tree = html.fromstring(page.content)

  site = re.search('(?<=www.)[\w]+(?=.com)', url)
  job_contents['site'] = site.group()
  job_contents['url'] = url


  if job_contents['site'] == 'dice':
    job_contents['title'] = tree.xpath('//h1[@class="jobTitle"]/text()')
    job_contents["employer"] = tree.xpath('//li[@class="employer"]/a/span/text()')
    job_contents["location"] = tree.xpath('//li[@class="location"]/span')[0].text
    job_contents["posted"] = tree.xpath('//li[@class="posted hidden-xs"]/text()')
  elif job_contents['site'] == 'indeed':
    job_contents['title'] = tree.xpath('//b[@class="jobtitle"]/font/text()')
    job_contents["employer"] = tree.xpath('//span[@class="company"]')[0].text
    job_contents["location"] = tree.xpath('//span[@class="location"]')[0].text
    job_contents["posted"] = tree.xpath('//span[@class="date"]')[0].text
  elif job_contents['site'] == 'simplyhired':
    job_contents['title'] = tree.xpath('//h1[@itemprop="title"]/text()')
    job_contents['title'] = [title.encode('ascii', 'ignore').decode('utf-8') for title in job_contents['title']]

    job_contents["employer"] = tree.xpath('//span[@class="company"]/text()')
    job_contents["location"] = tree.xpath('//span[@class="location"]/text()')
    job_contents["posted"] = tree.xpath('//span[@class="age"]/text()')
    job_contents["posted"] = [date.replace('(','').replace(')','') for date in job_contents["posted"]]

  return job_contents
