//
//  Calculate.swift
//  Algorithm
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 mac. All rights reserved.
//

import Foundation


func transform(with expression: String) -> String {
    let ss = Array(expression.replacingOccurrences(of: " ", with: ""))
    
    print(ss)
    
    let stack = Stack<String>()
    var ex: [String] = []
    
    for c in ss {
        let s = String(c)
        
        if let n = Int(s) {
            print(n)
            ex.append(s)
            
            if let f = stack.pop() {
                ex.append(f)
            }
        } else {
            stack.push(s)
        }
    }
    print(ex.joined())
    return ""
}


public func testCalculate() {
    testTransform()
}

func testTransform() {
    _ = transform(with: "1 + 2 + 3 + 4")
}
