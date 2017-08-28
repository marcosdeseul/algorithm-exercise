import Foundation

func get_diff(sum:Int, partial:Int) -> Int {    
    return abs((sum - partial) - partial)
}

public func solution(_ A : inout [Int]) -> Int {
    if A.count == 2 {
        return abs(A[0] - A[1]) 
    }            
    let sum = A.reduce(0, +)
    var partial_sum = A[0]
    var minimum = get_diff(sum:sum, partial:partial_sum)
    for x in A[1...A.endIndex-2] {
        partial_sum += x
        let diff = get_diff(sum:sum, partial:partial_sum)
        if diff == 0 {
            return 0
        }        
        if diff < minimum {            
            minimum = diff
        }
    }
    return minimum
}

let file: FileHandle? = FileHandle(forReadingAtPath: "input-01.txt")
if let file = file {
    // Read all the data
    let data = file.readDataToEndOfFile()
    // Close the file
    file.closeFile()
    // Convert our data to string
    let str = String(data: data, encoding: .utf8)!
    let lines:[String] = str.characters.split{$0 == "\n"}.map(String.init)
    var arr:[Int] = lines[0].components(separatedBy: " ").map{ Int($0)! }
    print(solution(&arr))    
} else {
    print("File was not loaded")
}


