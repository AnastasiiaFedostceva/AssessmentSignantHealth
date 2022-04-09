from demo_requests.endpoints import post, get
from utils.get_random_symbols import randomString, randomNumbers


def test_get_user_info():
    #A.Kugach: test to check user's info after registration
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
    user_token = get(endpoint='api/auth/token', auth=(user_login, user_password)).json()['token']

    response = get(endpoint='api/users/{}'.format(user_login), headers={'Token': user_token})
    r = response.json()
    print(r)
    assert r['status'] == 'SUCCESS'
    assert r['message'] == 'retrieval succesful'
    assert response.status_code == 200


def test_get_user_info_with_error():
    #A.Kugach: negative test to check 401 error (trying to get user's info without token)
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

    response = get(endpoint='api/users/{}'.format(user_login))
    r = response.json()
    print(r)
    print(response.status_code)
    assert r['status'] == 'FAILURE'
    assert r['message'] == 'Token authentication required'
    assert response.status_code == 401

