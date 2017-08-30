import Foundation

func solution(_ money: Int, _ number:Int, _ arr:[Int]) -> String {
    for (ix, x) in arr.enumerated() {
        for (iy, y) in arr[ix+1...arr.endIndex-1].enumerated() {
            if x + y == money {
                return "\(ix+1) \(iy+1+ix+1)"
            }
        }
    }
    return ""
}

let file: FileHandle? = FileHandle(forReadingAtPath: "input-01.txt")
if let file = file {
    // Read all the data
    let data = file.readDataToEndOfFile()
    // Close the file
    file.closeFile()
    // Convert our data to string
    let str = String(data: data, encoding: .utf8)
    let lines:[String] = str!.characters.split{$0 == "\n"}
      .map(String.init)

    // "next()!" should be replaced by "readLine()!"
    var li = lines.makeIterator()    
    let firstLine = Int(li.next()!)!
    for x in 1...firstLine {
        let m = Int(li.next()!)!
        let n = Int(li.next()!)!
        let arr = li.next()!.characters.split{$0 == " "}
          .map(String.init).map{ Int($0)! }
        let startTime = Date()
        let result = solution(m, n, arr)
        let endTime = Date()
        print(result)
        print((endTime.timeIntervalSince1970
                 - startTime.timeIntervalSince1970) * 1000)
    }
} else {
    print("File was not loaded")
}
