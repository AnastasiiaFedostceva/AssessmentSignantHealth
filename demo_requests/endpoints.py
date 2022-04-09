import requests
from utils.get_random_symbols import randomString, randomNumbers
from config import ENV
from os.path import join


def post(endpoint, **kwargs):
    return requests.post(join(ENV, endpoint), json=kwargs).status_code


def get(endpoint, **kwargs):
    return requests.get(join(ENV, endpoint), **kwargs)

