import Foundation
let file: FileHandle? = FileHandle(forReadingAtPath: "test.txt")
if let file = file {
    // Read all the data
    let data = file.readDataToEndOfFile()
    // Close the file
    file.closeFile()
    // Convert our data to string
    let str = String(data: data, encoding: .utf8)
    let lines:[String] = str!.characters.split{$0 == "\n"}
      .map(String.init)
    var lineIterator = lines.makeIterator()

    let count = Int(lineIterator.next()!)!
    for index in 1...count {
        var max_ = 0
        
        let n = lineIterator.next()!
        var arr:[Int] = lineIterator.next()!.characters
          .split{$0 == " "}.map(String.init).map{ Int($0)! }
        
        var max_value = arr.max()!
        var max_index = arr.index(of:max_value)!
        var max_sum = 0
        while arr.count > 0 {
            for value in arr[0..<max_index] {
                max_sum += max_value - value
            }
            arr = Array(arr[(max_index+1)..<arr.endIndex])
        }
        print(max_sum)
    }
} else {
    print("File was not loaded")
}
