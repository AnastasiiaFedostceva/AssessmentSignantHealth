from demo_requests.endpoints import post
from utils.get_random_symbols import randomString, randomNumbers


def test_registration_200():
    status_code = post(
        endpoint='api/users',
        username=randomString(10),
        password=randomNumbers(10),
        firstname=randomString(10),
        lastname=randomString(10),
        phone='+358{}'.format(randomNumbers(9)
                              ))
    assert status_code == 201


def test_registration_for_duplicate_user():
    double_user = randomString(10)
    status_code = post(
        endpoint='api/users',
        username=double_user,
        password=randomNumbers(10),
        firstname=randomString(10),
        lastname=randomString(10),
        phone='+358{}'.format(randomNumbers(9)
                              ))
    assert status_code == 201
    status_code = post(
        endpoint='api/users',
        username=double_user,
        password=randomNumbers(10),
        firstname=randomString(10),
        lastname=randomString(10),
        phone='+358{}'.format(randomNumbers(9)
                              ))
    assert status_code == 400
