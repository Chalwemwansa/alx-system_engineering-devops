#!/usr/bin/python3
"""this script contains code that connects and gets data from a given api"""
import requests
import sys


if __name__ == '__main__':
    id = sys.argv[1]
    name_res = requests.get(f'https://json\
placeholder.typicode.com/users/{id}')
    tasks_res = requests.get(f'https://json\
placeholder.typicode.com/users/{id}/todos')

    name = name_res.json().get('name')
    num_of_tasks = len(tasks_res.json())
    num_of_done_tasks = 0
    for task in tasks_res.json():
        if task.get('completed') is True:
            num_of_done_tasks += 1

    print(f'Employee {name} is done with\
tasks({num_of_done_tasks}/{num_of_tasks}):')
    for task in tasks_res.json():
        if task.get('completed') is True:
            print(f'\t {task.get("title")}')
