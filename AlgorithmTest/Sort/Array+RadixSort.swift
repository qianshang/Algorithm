//
//  Array+RadixSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2024/12/28.
//

import Foundation

extension Array where Element: BinaryInteger {
    /// 前缀排序
    func radixSort() -> [Element] {
        guard !self.isEmpty else { return self } // 空数组直接返回
        
        // 找到最大值，确定最大位数
        let maxElement = self.max() ?? 0
        var divisor: Element = 1 // 当前处理的位数（1=个位, 10=十位, 100=百位...）
        var sortedArray = self
        
        while maxElement / divisor > 0 {
            // 对当前位数进行计数排序
            sortedArray = countingSortByDigit(sortedArray, divisor: divisor)
            divisor *= 10
        }
        
        return sortedArray
    }
    
    private func countingSortByDigit(_ array: [Element], divisor: Element) -> [Element] {
        var count = Array(repeating: 0, count: 10) // 每位上的数字范围是 0-9
        var output = Array(repeating: Element(0), count: array.count)
        
        // 统计当前位数的数字出现次数
        for num in array {
            let digit = (num / divisor) % 10
            count[Int(digit)] += 1
        }
        
        // 前缀和计算，确定每个数字在输出数组中的位置
        for i in 1..<count.count {
            count[i] += count[i - 1]
        }
        
        // 逆序遍历数组，构造输出数组（确保稳定性）
        for num in array.reversed() {
            let digit = (num / divisor) % 10
            count[Int(digit)] -= 1
            output[Int(count[Int(digit)])] = num
        }
        
        return output
    }
}
