import Foundation

public func solution(_ N : Int) -> Int {
    var target = N
    let start = Int(log(Double(target)) / log(Double(2)))
    var binaryArr = [Int](repeating:0, count:start+1)
    for x in (0...start).reversed() {
        let pow_by_x = Int(pow(Double(2), Double(x)))
        if target >= pow_by_x {
            binaryArr[start-x] = 1
            target -= pow_by_x
        }
    }
    let splitted = binaryArr.map(String.init).joined(separator:"")
      .components(separatedBy:"1").map{ $0.characters.count }
    if splitted.count < 3 {
        return 0
    } else {
        return splitted[1..<splitted.endIndex-1].max()!
    }
}

let file: FileHandle? = FileHandle(forReadingAtPath: "input-02.txt")
if let file = file {
    // Read all the data
    let data = file.readDataToEndOfFile()
    // Close the file
    file.closeFile()
    // Convert our data to string
    let str = String(data: data, encoding: .utf8)!.trimmingCharacters(in: .whitespacesAndNewlines)
    // print(str)
    // let N = Int(str)!
    let N = 51712
    // assert(N != nil)
    print(solution(N))    
} else {
    print("File was not loaded")
}

