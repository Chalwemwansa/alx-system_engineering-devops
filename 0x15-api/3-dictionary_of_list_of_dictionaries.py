#!/usr/bin/python3
"""this script contains code that connects and gets data from a given api"""
from json import dump
import requests


users_res = requests.get('https://jsonplaceholder.typicode.com/users')
users_list = users_res.json()

main_dict = {}
for user in users_list:
    user_list = []
    id = user.get('id')
    username = user.get('username')
    user_tasks_res = requests.get(f'https://jsonplaceholder.typicode.com/users/{id}/todos')
    user_tasks_list = user_tasks_res.json()
    for task in user_tasks_list:
        user_task_dict = {}
        user_task_dict['username'] = f'{username}'
        user_task_dict['task'] = task.get('title')
        user_task_dict['completed'] = task.get('completed')
        user_list.append(user_task_dict)
    main_dict[f'{id}'] = user_list

with open('todo_all_employees.json', 'w') as fd:
    dump(main_dict, fd)
