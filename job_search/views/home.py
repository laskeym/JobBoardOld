from pyramid.view import view_config

import time

from job_search.crawlers.crawlers import DiceCrawler

@view_config(route_name='home', renderer='../templates/home.mako')
def index(request):
    return {}

@view_config(route_name='job_search', renderer='json')
def job_search(request):
    params = {
        'q': request.params['q'],
        'l': request.params['l']
    }

    start = time.time()

    dice = DiceCrawler(params)
    dice.start()
    job_listing = dice.crawl()

    print('*'*75)
    print('It took ', time.time()-start, ' seconds')

    return {'job_listing': job_listing['jobs']}
