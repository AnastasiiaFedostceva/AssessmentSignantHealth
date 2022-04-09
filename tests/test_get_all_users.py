from demo_requests.endpoints import get, post
from utils.get_random_symbols import randomString, randomNumbers


def test_get_all_users_200():
    #A.Kugach: simple test to get the list of users and check it's response status code
    response = get(endpoint='api/users')
    r = response.json()
    users_list = r['payload']
    assert r['status'] == 'SUCCESS'
    assert response.status_code == 200


def test_new_user_in_list():
    #A.Kugach: test to check that new user appears in the list after registration
    new_user = randomString(10)
    post(
        endpoint='api/users',
        username=new_user,
        password=randomNumbers(10),
        firstname=randomString(10),
        lastname=randomString(10),
        phone='+358{}'.format(randomNumbers(9)
                              ))
    response = get(endpoint='api/users')
    r = response.json()
    users_list = r['payload']
    assert new_user in users_list

