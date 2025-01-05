//
//  Array+InsertSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2025/1/5.
//

import Foundation

extension Array where Element: Comparable {
    /// 插入排序
    func insertSort() -> [Element] {
        var res = self
        for x in 1..<res.count {
            var y = x
            let temp = res[y]
            while y > 0 && temp < res[y - 1] {
                res[y] = res[y - 1]
                y -= 1
            }
            res[y] = temp
        }
        return res
    }
    
}
