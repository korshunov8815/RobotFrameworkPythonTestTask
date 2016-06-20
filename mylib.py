import requests


def get_method():
    """
    Args : None
    
    Returns : Response object (GET http://httpbin.org/get)

    Raises : Nothing
    """
    return requests.get("http://httpbin.org/get")


def auth_method(user, password):
    """
    Args : User's login and password

    Returns : Response object (GET http://httpbin.org/basic-auth/)

    Raises : Nothing
    """
    return requests.get("http://httpbin.org/basic-auth/" + user + "/" +
        password)


def stream_method(num):
    """
    Args : Number of lines

    Returns : Response object (GET http://httpbin.org/stream/)

    Raises : Nothing
    """
    return requests.get("http://httpbin.org/stream/"+num)
