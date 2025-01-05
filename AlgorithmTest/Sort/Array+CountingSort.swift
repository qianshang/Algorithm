//
//  Array+CountingSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2024/12/24.
//

import Foundation

extension Array where Element: BinaryInteger {
    /// 计数排序
    func countingSort() -> [Element] {
        guard let minElement = self.min(), let maxElement = self.max() else {
            return self // 如果数组为空，直接返回
        }
        
        let total = Int(maxElement - minElement + 1) // 元素范围
        var count = Array<Int>(repeating: 0, count: total) // 创建计数数组
        
        // 统计每个元素的出现次数
        for num in self {
            count[Int(num - minElement)] += 1
        }
        
        // 前缀和计算：记录每个元素最终在排序数组中的位置
        for i in 1..<count.count {
            count[i] += count[i - 1]
        }
        
        // 构造排序结果数组
        var sortedArray = Array(repeating: Element(0), count: self.count)
        for num in self.reversed() { // 逆序遍历，保证稳定性
            let index = Int(num - minElement)
            count[index] -= 1
            let e = count[index]
            sortedArray[e] = num
        }
        
        return sortedArray
    }
}
