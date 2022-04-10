from utils.api_helper import register, update_user_info, get_token
from utils.get_random_symbols import randomString, randomNumbers


def test_update_user_profile_401():
    # A.Kugach: negative test to check 401 error (profile update without token)
    username = randomString(10)
    password = randomNumbers(10)
    register(username=username, password=password)
    status_code = update_user_info(updated_username=username, token=None).status_code
    assert status_code == 401


def test_update_user_profile_username_403():
    # A.Kugach: negative test to check 403 error (username cannot be updated)
    username = randomString(10)
    password = randomNumbers(10)
    register(username=username, password=password)
    token = get_token(username=username, password=password).json()['token']
    status_code = update_user_info(updated_username=username, token=token, username=f'updated_{username}').status_code
    assert status_code == 403


def test_update_user_profile_firstname():
    # A.Kugach: simple test to check firstname update
    username = randomString(10)
    password = randomNumbers(10)
    firstname = randomString(10)
    register(username=username, password=password, firstname=firstname)
    token = get_token(username=username, password=password).json()['token']
    response_update_profile = update_user_info(updated_username=username, token=token, firstname=f'updated_{firstname}')
    assert response_update_profile.status_code == 201
    assert response_update_profile.json()['message'] == 'Updated'
    assert response_update_profile.json()['status'] == 'SUCCESS'


def test_update_user_profile_lastname():
    # A.Kugach: simple test to check lastname update
    username = randomString(10)
    password = randomNumbers(10)
    lastname = randomString(10)
    register(username=username, password=password, lastname=lastname)
    token = get_token(username=username, password=password).json()['token']
    response_update_profile = update_user_info(updated_username=username, token=token, lastname=f'updated_{lastname}')
    assert response_update_profile.json()['message'] == 'Updated'
    assert response_update_profile.json()['status'] == 'SUCCESS'
    assert response_update_profile.status_code == 201


def test_update_user_profile_several_fields():
    # A.Kugach: simple test to check several fields at one update
    username = randomString(10)
    password = randomNumbers(10)
    firstname = randomNumbers(10)
    lastname = randomString(10)
    phone = f'+358{randomNumbers(9)}'
    register(
        username=username,
        password=password,
        firstname=firstname,
        lastname=lastname,
        phone=phone
    )
    token = get_token(username=username, password=password).json()['token']
    response_update_profile = update_user_info(updated_username=username,
                                               token=token,
                                               lastname=f'updated_{lastname}',
                                               firstname=f'updated_{firstname}',
                                               phone=f'000{phone}'
                                               )
    assert response_update_profile.status_code == 201
    assert response_update_profile.json()['message'] == 'Updated'
    assert response_update_profile.json()['status'] == 'SUCCESS'
