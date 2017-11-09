from lxml import html
import requests

from pprint import pprint

from job_search.scripts.helpers import AutoVivification

class DiceCrawler():
    def __init__(self, params):
        self.params = params
        self.base_url = "https://www.dice.com"
        self.tree = None

    def start(self):
        page = requests.get(self.base_url + '/jobs', params=self.params)
        self.tree = html.fromstring(page.content)

    def crawl(self):
        job_contents ={
            "jobs": []
        }
        job_links = self.tree.xpath('//div[@class="complete-serp-result-div"]/div[@class="serp-result-content" or "serp-result-content bold-highlight"]/ul/li/h3/a')


        for i,job_posting in enumerate(job_links):
            job_posting = self.base_url + job_posting.attrib['href']
            job_details = {}

            job_page = requests.get(job_posting)
            job_page_tree = html.fromstring(job_page.content)

            job_details["job_link"] = job_posting
            job_details["job_title"] = job_page_tree.xpath('//h1[@class="jobTitle"]/text()')
            job_details["job_employer"] = job_page_tree.xpath('//li[@class="employer"]/a/span/text()')
            job_details["job_loc"] = job_page_tree.xpath('//li[@class="location"]/span')[0].text
            job_details["job_posted"] = job_page_tree.xpath('//li[@class="posted hidden-xs"]/text()')

            job_contents["jobs"].append(job_details)

        return job_contents
