import requests


class BaseClass:
    def __init__(self, headers=None):
        if headers is None:
            self.headers = {}
        else:
            self.headers = headers
        self.headers['Content-Type'] = 'application/json'
