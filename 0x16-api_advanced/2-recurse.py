#!/usr/bin/python3
"""constains a function that lists all the articles of a given
    reddict"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """recursive function to the reddit api to get the list of articles"""
    header = {
                'User-Agent': 'chalwe_demo_reddit_module'
             }
    if len(hot_list) == 0:
        # query the api without the after argument
        response = requests.get('https://www.reddit.com/r/{}/hot.json\
?limit=1'.format(subreddit), headers=header)
    else:
        # query with the after part
        response = requests.get('https://www.reddit.com/r/{}/hot.json\
?limit=1&after={}'.format(subreddit, after), headers=header)
    child = response.json().get('data').get('children')[0]
    after = response.json().get('data').get('after')
    title = child.get('data').get('title')
    hot_list.append(title)
    if after is None:
        return hot_list
    return recurse(subreddit, hot_list, after)
print(recurse('programming'))
