from pyramid.view import view_config

import itertools
from multiprocessing.dummy import Pool as ThreadPool

from job_search.crawlers import crawler

@view_config(route_name='home', renderer='../templates/home.mako')
def index(request):
    return {}

@view_config(route_name='job_search', renderer='json')
def job_search(request):
    sites = request.GET.getall("sites[]")

    params = {
        'q': request.params['q'],
        'l': request.params['l']
    }

    search = [list(t) for t in zip(sites, itertools.repeat(params))]

    pool = ThreadPool(4)
    urls = pool.starmap(crawler.get_urls, search)
    urls = list(itertools.chain.from_iterable(urls))

    job_results = pool.map(crawler.parse, urls)

    pool.terminate()
    pool.join()

    return {'job_results': job_results}
