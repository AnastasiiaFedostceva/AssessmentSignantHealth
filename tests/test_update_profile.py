from demo_requests.endpoints import get, post, put
from utils.get_random_symbols import randomString, randomNumbers


def test_update_user_profile_name_401():
    # A.Kugach: negative test to check 401 error (profile update without token)
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
    user_token = r['token']

    response_update_profile = put(endpoint='api/users/{}'.format(user_login), json={'username': 'updated_' + user_login})
    assert response_update_profile.status_code == 401


def test_update_user_profile_username_403():
    # A.Kugach: negative test to check 403 error (username cannot be updated)
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
    user_token = r['token']

    response_update_profile = put(endpoint='api/users/{}'.format(user_login), json={'username': 'updated_' + user_login},
                                  headers={'Token': user_token})
    assert response_update_profile.status_code == 403

def test_update_user_profile_firstname():
    # A.Kugach: simple test to check firstname update
    user_login = randomString(10)
    user_password = randomNumbers(10)
    firstname = randomString(10)
    post(
        endpoint='api/users',
        username=user_login,
        password=user_password,
        firstname=firstname,
        lastname=randomString(10),
        phone='+358{}'.format(randomNumbers(9)
                              ))

    response = get(endpoint='api/auth/token', auth=(user_login, user_password))
    r = response.json()
    user_token = r['token']

    response_update_profile = put(endpoint='api/users/{}'.format(user_login), json={'firstname': 'updated_' + firstname},
                                  headers={'Token': user_token})
    assert response_update_profile.status_code == 201
    assert response_update_profile.json()['message'] == 'Updated'
    assert response_update_profile.json()['status'] == 'SUCCESS'

def test_update_user_profile_lastname():
    # A.Kugach: simple test to check lastname update
    user_login = randomString(10)
    user_password = randomNumbers(10)
    lastname = randomString(10)
    post(
        endpoint='api/users',
        username=user_login,
        password=user_password,
        firstname=randomString(10),
        lastname=lastname,
        phone='+358{}'.format(randomNumbers(9)
                              ))

    response = get(endpoint='api/auth/token', auth=(user_login, user_password))
    r = response.json()
    user_token = r['token']

    response_update_profile = put(endpoint='api/users/{}'.format(user_login), json={'lastname': 'updated_' + lastname},
                                  headers={'Token': user_token})
    assert response_update_profile.json()['message'] == 'Updated'
    assert response_update_profile.json()['status'] == 'SUCCESS'
    assert response_update_profile.status_code == 201

def test_update_user_profile_several_fields():
    # A.Kugach: simple test to check several fields at one update
    user_login = randomString(10)
    user_password = randomNumbers(10)
    firstname = randomNumbers(10)
    lastname = randomString(10)
    phone = '+358{}'.format(randomNumbers(9))
    post(
        endpoint='api/users',
        username=user_login,
        password=user_password,
        firstname=firstname,
        lastname=lastname,
        phone=phone
    )

    response = get(endpoint='api/auth/token', auth=(user_login, user_password))
    r = response.json()
    user_token = r['token']

    response_update_profile = put(endpoint='api/users/{}'.format(user_login),
                                  json={'lastname': 'updated_' + lastname, 'firstname': 'updated_' + firstname, 'phone':'000' + phone},
                                  headers={'Token': user_token})
    assert response_update_profile.status_code == 201
    assert response_update_profile.json()['message'] == 'Updated'
    assert response_update_profile.json()['status'] == 'SUCCESS'