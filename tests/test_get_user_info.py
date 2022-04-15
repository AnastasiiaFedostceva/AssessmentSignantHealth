from utils.api_helper import register, get_token, get_user_info
from utils.get_random_symbols import randomString, randomNumbers


def test_get_user_info():
    # A.Kugach: test to check user's info after registration
    username = randomString(10)
    password = randomNumbers(10)
    register(username=username, password=password)
    token = get_token(username=username, password=password).json()['token']
    response = get_user_info(username=username, token=token)
    assert response.json()['status'] == 'SUCCESS'
    assert response.json()['message'] == 'retrieval succesful'
    assert response.status_code == 200


def test_get_user_info_with_error():
    # A.Kugach: negative test to check 401 error (trying to get user's info without token)
    username = randomString(10)
    password = randomNumbers(10)
    register(username=username, password=password)
    response = get_user_info(username=username, token=None)
    assert response.json()['status'] == 'FAILURE'
    assert response.json()['message'] == 'Token authentication required'
    assert response.status_code == 401


def test_get_user_info_for_unexisting_user():
    #A.Kugach: negative test to check http error code 500 for getting info for unexisting user
    username = randomString(10)
    password = randomNumbers(10)
    register(username=username, password=password)
    token = get_token(username=username, password=password).json()['token']
    response = get_user_info(username='nastyanastya', token=token)
    assert response.status_code == 500
