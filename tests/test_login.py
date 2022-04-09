from demo_requests.endpoints import post, get
from utils.get_random_symbols import randomString, randomNumbers


def test_get_token_for_valid_user():
    user_login = randomString(10)
    user_password = randomNumbers(10)
    post(
        endpoint='api/users',
        username=user_login,
        password=user_password,
        firstname=randomString(10),
        lastname=randomString(10),
        phone='+358{}'.format(randomNumbers(9)
                              ))

    response = get(endpoint='api/auth/token', auth=(user_login, user_password))
    r = response.json()
    assert r['status'] == 'SUCCESS'
    assert response.status_code == 200
    assert r['token'] != ''

def test_get_token_for_invalid_user():
    user_login = randomString(10)
    user_password = randomNumbers(10)
    post(
        endpoint='api/users',
        username=user_login,
        password=user_password,
        firstname=randomString(10),
        lastname=randomString(10),
        phone='+358{}'.format(randomNumbers(9)
                              ))

    response = get(endpoint='api/auth/token', auth=(user_login, 'some_pass'))
    r = response.json()
    assert r['status'] == 'FAILURE'
    assert response.status_code == 401

