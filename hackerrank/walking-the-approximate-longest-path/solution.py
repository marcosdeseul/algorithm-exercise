"""
Hacker Rank does not allow you to use typing and readline()
"""
from collections import defaultdict

def recur_list(history, target, result_list_, road_dict_):
    if target in history:
        result_list.append(history)
    else:
        for next_city_ in road_dict[target]:
            recur_list(history + [target], next_city_, result_list_, road_dict_)

with open("input-02.txt") as f:
    n_cities, n_roads = list(map(int, f.readline().strip().split(" ")))    
    arr = [tuple(map(int, f.readline().strip().split(" "))) for _ in range(n_roads)]
    road_dict = defaultdict(list)
    for road in arr:
        road_dict[road[0]] += [road[1]]
        road_dict[road[1]] += [road[0]]

    smallest_length = -1
    smallest_keys = []
    for key, value in road_dict.items():
        if smallest_length == -1:
            smallest_length = value
            smallest_length.append(key)
            continue
        if value < smallest_length:
            smallest_length = value
            smallest_keys = [key]
        elif value == smallest_length:
            smallest_keys.append(key)
    result_list = []
    for city_ in smallest_keys:
        recur_list([], city_, result_list, road_dict)
    sorted_result_list = sorted(result_list, key=len, reverse=True)
    longest = sorted_result_list[0]
    print(len(longest))
    print(" ".join(map(str, longest)))
