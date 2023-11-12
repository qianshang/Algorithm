//
//  Support.swift
//  Algorithm
//
//  Created by 程维 on 2023/11/12.
//  Copyright © 2023 mac. All rights reserved.
//

import Foundation

protocol AlgorithmTest {
    
    func testSolution()
    
}

func checkTime<T>(_ handle: () -> T) {
    let start: TimeInterval = CFAbsoluteTimeGetCurrent()
    let ret = handle()
    let used = (CFAbsoluteTimeGetCurrent() - start)
    
    print("\(ret) _> \(used.toString)")
}

extension TimeInterval {
    var toString: String {
        if self >= 1.0 {
            return String(format: "%.3fs", ceil(self * 1_000) / 1000)
        } else if self >= 0.001 {
            return String(format: "%.3fms", ceil(self * 1_000_000) / 1000)
        } else if self >= 0.000_001 {
            return String(format: "%.3fus", ceil(self * 1_000_000_000) / 1000)
        } else {
            return String(format: "%.3fns", ceil(self * 1_000_000_000_000) / 1000)
        }
        
    }
}
