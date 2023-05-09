#!/usr/bin/python3
"""Advanced Apis Module"""
import requests
import sys


def number_of_subscribers(subreddit):
    """function that queries the Reddit API and returns the number
    of subscribers (not active users, total subscribers) for a given
    subreddit. If an invalid subreddit is given,
    the function should return 0."""

    client_id = '0vTOQrl3QM47iikslKqw1Q'
    client_secret = 'B3AVOHPuQw7VMitr2Ue8UapdylUNNw'
    user_agent = 'MyBot/0.0.1'
    auth = requests.auth.HTTPBasicAuth(client_id, client_secret)

    data = {
        'grant_type': 'client_credentials',
        'client_id': client_id,
        'client_secret': client_secret,
    }

    headers = {'User-Agent': user_agent}
    response = requests.post(
        'https://www.reddit.com/api/v1/access_token',
        data=data,
        headers=headers,
        auth=auth)
    token = response.json()['access_token']

    # Make an authenticated API request to retrieve the number of subscribers
    # for the given subreddit
    headers = {'User-Agent': user_agent,
               'Authorization': 'Bearer {}'.format(token)}
    response = requests.get(
        'https://oauth.reddit.com/r/{}/about'.format(subreddit),
        headers=headers,
        allow_redirects=False)
    if response.status_code == 200:
        data = response.json()['data']
        subscribers = data['subscribers']
        return (subscribers)
    else:
        return (0)


if __name__ == '__main__':
    if len(sys.argv) > 1:
        subred = sys.argv[1]
        number_of_subscribers(subred)
