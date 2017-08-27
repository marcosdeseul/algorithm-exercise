from itertools import product

def get_hourglass_sum(A, x, y):
    return sum(A[y][x:x+3]) + A[y+1][x+1] + sum(A[y+2][x:x+3])  

with open("input-03.txt") as f:
    lines = f.readlines()
    matrix = list(map(lambda x: list(map(int, x.split(" "))), lines))
    print(max(get_hourglass_sum(matrix, x, y) for x, y in product(range(0, 4), repeat=2)))
