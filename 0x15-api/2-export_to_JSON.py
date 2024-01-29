#!/usr/bin/python3
"""this script contains code that connects and gets data from a given api"""
from json import dump
import requests
import sys


id = sys.argv[1]
file_name = f'{id}.json'
name_res = requests.get(f'https://jsonplaceholder.typicode.com/users/{id}')
tasks_res = requests.get(f'https://jsonplaceholder.typicode.com/users/{id}/todos')
name = name_res.json().get('username')
tasks_list = tasks_res.json()

user_dict = {f'{id}': []}
for task in tasks_list:
    task_dict = {}
    task_dict['task'] = task.get('title')
    task_dict['completed'] = task.get('completed')
    task_dict['username'] = f'{name}'
    user_dict[f'{id}'].append(task_dict)

with open(f'{file_name}', 'w') as fd:
    dump(user_dict, fd)
