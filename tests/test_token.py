from utils.api_helper import register, get_token
from utils.get_random_symbols import randomString, randomNumbers


def test_get_token_for_valid_user():
    # A.Kugach: simple test to get user's token
    username = randomString(10)
    password = randomNumbers(10)
    register(username=username, password=password)
    response = get_token(username=username, password=password)
    assert response.json()['status'] == 'SUCCESS'
    assert response.status_code == 200
    assert response.json()['token'] != ''


def test_get_token_for_invalid_user():
    # A.Kugach: negative test to check 401 error if user's credentials are incorrect (password)
    username = randomString(10)
    register(username=username)
    response = get_token(username=username, password='some pass')
    r = response.json()
    assert r['status'] == 'FAILURE'
    assert response.status_code == 401

