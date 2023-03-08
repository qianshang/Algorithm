//
//  main.swift
//  Algorithm
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 mac. All rights reserved.
//

import Foundation

protocol AlgorithmTest {
    
    func testSolution()
    
}

final class LeetCode {
    private init() { }
    
    private static let allCase: [AlgorithmTest] = [
//        Chapter1(),
//        Chapter2(),
//        Chapter3(),
        Chapter4(),
    ]
    
    class func test() {
        allCase.forEach { $0.testSolution() }
    }
}

LeetCode.test()

