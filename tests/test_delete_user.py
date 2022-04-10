from utils.api_helper import get_all_users, register, delete_user
from utils.get_random_symbols import randomString


def test_delete_user():
    # A.Kugach = check that methods that are not described are not allowed
    username = randomString(10)
    register(username=username)
    get_all_users()
    assert delete_user(username).status_code == 405
