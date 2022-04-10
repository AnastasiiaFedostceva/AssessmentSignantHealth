from utils.api_helper import get_all_users, register
from utils.get_random_symbols import randomString


def test_get_all_users_200():
    # A.Kugach: simple test to get the list of users and check it's response status code
    response = get_all_users()
    assert response.json()['status'] == 'SUCCESS'
    assert response.status_code == 200


def test_new_user_in_list():
    # A.Kugach: test to check that new user appears in the list after registration
    username = randomString(10)
    register(username=username)
    response = get_all_users()
    assert response.json()['status'] == 'SUCCESS'
    assert response.status_code == 200
    assert username in response.json()['payload']

