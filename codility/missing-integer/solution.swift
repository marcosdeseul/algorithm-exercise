import Foundation

func solution(_ A:inout [Int]) -> Int{
    var result = 1
    let filteredIntSet = Set<Int>(A.filter{$0 > 0})
    while filteredIntSet.contains(result) {
        result += 1        
    }
    return result
}

let file: FileHandle? = FileHandle(forReadingAtPath: "input-02.txt")
if let file = file {
    // Read all the data
    let data = file.readDataToEndOfFile()
    // Close the file
    file.closeFile()
    // Convert our data to string
    let str = String(data: data, encoding: .utf8)!
    let lines:[String] = str.characters.split{$0 == "\n"}.map(String.init)
    var arr:[Int] = lines[0].components(separatedBy: " ").map{ Int($0)! }
    let startTime = Date()
    print(solution(&arr))
    let endTime = Date()
    // Milli Seconds
    print((endTime.timeIntervalSince1970 - startTime.timeIntervalSince1970) * 1000)
} else {
    print("File was not loaded")
}
