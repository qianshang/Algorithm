//
//  Array+ShellSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2025/1/5.
//

import Foundation

extension Array where Element: Comparable {
    /// 希尔排序
    func shellSort() -> [Element] {
        var a = self
        let n = a.count-1
        
        var gap = n / 2
        while gap > 0 {
            for j in gap...n {
                if a[j] < a[j-gap]{
                    let tmep = a[j]
                    var k = j - gap
                    while k >= 0 && a[k] > tmep {//扫一遍 好填最小值
                        a[k + gap] = a[k]
                        k -= gap
                    }
                    a[k + gap] = tmep
                }
            }
            gap /= 2
        }
        return a
    }
    
}
