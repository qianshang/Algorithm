//
//  Array+MergeSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2024/12/24.
//

import Foundation

extension Array where Element: Comparable {
    
    /// 归并排序-递归
    func mergeSort() -> [Element] {
        guard count > 1 else { return self }  // 如果数组只有一个元素，则已经有序
        
        let middle = count / 2  // 找到中间点
        let left = Array(self[..<middle])  // 左半部分
        let right = Array(self[middle...]) // 右半部分
        
        // 递归分解并排序，然后合并
        return merge(left: left.mergeSort(), right: right.mergeSort())
    }
    
    // 归并排序 - 非递归
    func mergeSortIterative() -> [Element] {
        var new = self
        var width = 1  // 初始步长为 1
        
        while width < new.count {
            var i = 0
            while i < new.count {
                let left = i
                let mid = Swift.min(i + width, new.count)
                let right = Swift.min(i + 2 * width, new.count)
                
                // 合并两个相邻的子数组
                let merged = merge(
                    left: Array(new[left..<mid]),
                    right: Array(new[mid..<right])
                )
                
                // 将合并后的结果写回数组
                new.replaceSubrange(left..<right, with: merged)
                
                i += 2 * width
            }
            
            width *= 2  // 每次步长加倍
        }
        
        return new
    }
    
    // 合并两个有序数组
    private func merge(left: [Element], right: [Element]) -> [Element] {
        var result: [Element] = []
        var i = 0, j = 0
        
        // 比较两个数组的元素，按顺序合并
        while i < left.count && j < right.count {
            if left[i] <= right[j] {
                result.append(left[i])
                i += 1
            } else {
                result.append(right[j])
                j += 1
            }
        }
        
        // 追加剩余的元素
        while i < left.count {
            result.append(left[i])
            i += 1
        }
        while j < right.count {
            result.append(right[j])
            j += 1
        }
        
        return result
    }
}
