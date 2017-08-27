import math

def solution(N):
    start = int(math.log2(N))
    binary_list = [0] * (start+1)
    for x in range(start, -1, -1):
        print(N, 2 ** x)
        if N >= 2 ** x:
            binary_list[start-x] = 1
            N -= 2 ** x
    splitted = list(map(len, "".join(map(str, binary_list)).split("1")))
    if len(splitted) < 3:
        return 0
    return max(splitted[1:-1])

if __name__ == "__main__":
    with open("input-01.txt") as f:
        num = int(f.readline())            
        print(solution(num))
        
