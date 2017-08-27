if __name__ == "__main__":
    with open("test.txt") as f:
        num_line = int(f.readline())
        for _ in range(num_line):
            num = f.readline()
            arr = list(map(int, f.readline().split(" ")))            
            sum_ = 0
            while len(arr) > 0:
                max_value = max(arr)
                max_index = arr.index(max_value)                
                sum_ += sum(max_value - x for x in arr[:max_index])
                arr = arr[max_index+1:]
            print(sum_)
                
