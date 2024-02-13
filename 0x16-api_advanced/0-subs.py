#!/usr/bin/python3
"""module contains a function that uses the reddit api
    to get the number of subscribers to a given reddit subreddit"""
import requests


def number_of_subscribers(subreddit):
    """function that uses the reddit api to get num of subs"""
    header = {
                'User-Agent': 'chalwe_demo_reddit_module'
             }
    response = requests.get('https://www.reddit.com/r/{}/\
about.json'.format(subreddit),
                            headers=header)
    if not response.status_code == 200:
        return 0
    return response.json().get('data').get('subscribers')
