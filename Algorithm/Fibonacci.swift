//
//  Fibonacci.swift
//  Algorithm
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 mac. All rights reserved.
//

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


public func testFibonacci(to index: Int) {
    print("===============Fibonacci================")
    
    var text: String = ""
    for i in 0...index {
        text += "(\(i+1):\(fibonacci(at: i)))"
    }
    print(text)
}



