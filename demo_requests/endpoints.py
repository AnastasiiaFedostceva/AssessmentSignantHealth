import requests
from config import ENV
from os.path import join


def post(endpoint, **kwargs):
    return requests.post(join(ENV, endpoint), json=kwargs).status_code


def get(endpoint, **kwargs):
    return requests.get(join(ENV, endpoint), **kwargs)


def put(endpoint, **kwargs):
    return requests.put(join(ENV, endpoint), **kwargs)
