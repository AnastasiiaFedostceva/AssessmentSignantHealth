from utils.api_helper import register
from utils.get_random_symbols import randomString


def test_registration_200():
    # A.Kugach: simple test to check user's registration
    status_code = register()
    assert status_code == 201


def test_registration_for_duplicate_user():
    # A.Kugach: test to check the unique key (username) for registration
    double_user = randomString(10)
    status_code = register(username=double_user)

    assert status_code == 201
    status_code = register(username=double_user)
    assert status_code == 400


def test_register_with_null_username():
    #A.Kugach: Check registration with empty username
    status_code = register(username=None)
    assert status_code == 500


def test_register_with_null_password():
    # A.Kugach: Check registration with empty password
    status_code = register(password=None)
    print("TEST >>> ", status_code)
    assert status_code == 500
