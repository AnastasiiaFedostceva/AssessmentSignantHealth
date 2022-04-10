import requests
from config import ENV
from os.path import join


def post(endpoint, **kwargs):
    return requests.post(url=join(ENV, endpoint), json=kwargs).status_code


def get(endpoint, **kwargs):
    return requests.get(url=join(ENV, endpoint), **kwargs)


def put(endpoint, headers=None, **kwargs):
    return requests.put(url=join(ENV, endpoint), headers=headers, json=kwargs)


def delete(endpoint, **kwargs):
    return requests.delete(url=join(ENV, endpoint), **kwargs)
