import Foundation

func get_hourglass_sum(xIndex x:Int, yIndex y:Int, _ A:[[Int]]) -> Int {
    return A[y][x] + A[y][x+1] + A[y][x+2]
      + A[y+1][x+1]
      + A[y+2][x] + A[y+2][x+1] + A[y+2][x+2] 
}

let file: FileHandle? = FileHandle(forReadingAtPath: "input-03.txt")
if let file = file {
    // Read all the data
    let data = file.readDataToEndOfFile()
    // Close the file
    file.closeFile()
    // Convert our data to string
    let str = String(data: data, encoding: .utf8)
    // (1...6).map{ _ in readline()!.characters.split{ $0 == "\n" }.map(String.init) }
    let lines:[String] = str!.characters.split{ $0 == "\n" }.map(String.init)
    let matrix:[[Int]] = lines.map{a in a.characters.split{ $0 == " " }
                                       .map(String.init).map{ Int($0)! }}
    var max_:Int = -9 * 7
    for y in 0...3 {
        for x in 0...3 {
            let temp = get_hourglass_sum(xIndex:x, yIndex:y, matrix)
            if temp > max_ {
                max_ = temp
            }
        }
    }
    print(max_)
    
} else {
    print("File was not loaded")
}

