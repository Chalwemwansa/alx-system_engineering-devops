#!/usr/bin/python3
"""this script contains code that connects and gets data from a given api"""
import requests
import sys


id = sys.argv[1]
file_name = f'{id}.csv'
name_res = requests.get(f'https://jsonplaceholder.typicode.com/users/{id}')
tasks_res = requests.get(f'https://jsonplaceholder.typicode.com/users/{id}/todos')
name = name_res.json().get('username')
task_list = tasks_res.json()

with open(f'{file_name}', 'w') as fd:
    for task in task_list:
        fd.write(f'"{id}","{name}","{task.get("completed")}","{task.get("title")}"\n')
