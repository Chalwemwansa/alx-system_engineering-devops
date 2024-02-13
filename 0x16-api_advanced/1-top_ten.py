#!/usr/bin/python3
"""this module contains a function that uses the reddit api to get
    the titles of the top ten hot posts in a given subreddict"""
import requests


def top_ten(subreddit):
    """the function that prints the top ten hot titles from a given
        subreddit"""
    header = {
                'User-Agent': 'u/chalwe_demo_reddit_script'
             }
    response = requests.get('https://www.reddit.com/r/{}/\
hot.json?limit=10'.format(subreddit),
                            headers=header)
    if not response.status_code == 200:
        # means the request wasn't successful
        return
    list = response.json().get('data').get('children')
    if list is not None:
        for child in list:
            # print the title of every child in the list excluding stickies
            # if not child.get('data').get('stickied'):
            print(child.get('data').get('title'))
