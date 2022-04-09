import random
import string


def randomString(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))


def randomNumbers(length=10):
    """Generate a random numbers of fixed length"""
    numbers = string.digits
    return ''.join(random.choice(numbers) for _ in range(length))