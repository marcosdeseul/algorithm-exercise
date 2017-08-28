import Foundation

public func solution(_ A:inout [Int]) -> Int {
    // var dict[Int:Int] = [:] 
    // for x in A {
    //     if !dict[x] {
    //         dict[x] = 1
    //     } else {
    //         dict[x] = nil
    //     }
    // }
    // return dict.keys[0]
    return A.reduce(0, ^)
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
