/**
 * 斐波拉契数列
 */

import Foundation

func fibonacci(at index: Int) -> Int {
    guard index >= 0 else {
        return 0
    }
    if index == 0 || index == 1 {
        return 1
    }
    return fibonacci(at: index - 1) + fibonacci(at: index - 2)
}

func fibonacci_1(at index: Int) -> Int64 {
    var r1: Int64 = 0
    guard index > 0 else { return r1 }
    var r2: Int64 = 1
    guard index > 1 else { return r2 }
    
    for _ in 1..<index {
        let t = r1
        r1 = r2
        r2 = t + r2
    }
    
    return r2
}


public func testFibonacci(to index: Int) {
    print("===============Fibonacci================")
    
    var text: String = ""
    for i in 0...index {
        text += "(\(i+1):\(fibonacci(at: i)))"
    }
    print(text)
}



