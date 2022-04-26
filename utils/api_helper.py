from utils.request_helper import post, get, put, delete
from utils.get_random_symbols import randomNumbers, randomString


def register(**kwargs):

    user = {
        'username': randomString(10),
        'password': randomString(10),
        'firstname': randomString(10),
        'lastname': randomString(10),
        'phone': f'+358{randomNumbers(9)}'
    }

    user.update(kwargs)
    for item in user.items():
        print('User data to register >>> ', item)
    return post(
        endpoint='api/users',
        **user
    )


def get_token(username, password):
    return get(endpoint='api/auth/token', auth=(username, password))


def update_user_info(updated_username, token, **kwargs):
    print(updated_username)
    return put(endpoint=f'api/users/{updated_username}', headers={'Token': token}, **kwargs)


def get_user_info(username, token):
    return get(endpoint=f'api/users/{username}', headers={'Token': token})


def get_all_users():
    return get(endpoint='api/users')


def delete_user(username):
    return delete(endpoint=f'api/users/{username}')
