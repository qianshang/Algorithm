//
//  Array+SelectSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2025/1/5.
//

import Foundation

extension Array where Element: Comparable {
    /// 选择排序
    func selectSort() -> [Element] {
        let elementCount = count
        var res = self
        var min: Int = 0
        
        for i in 0..<elementCount {
            min = i
            for j in (i+1)..<elementCount {
                if res[min] > res[j] {
                    min = j
                }
            }
            
            if min != i {
                res.swapAt(i, min)
            }
        }
        
        return res
    }
    
}
