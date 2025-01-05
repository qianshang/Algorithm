//
//  Array+QuickSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2024/12/23.
//

import Foundation

extension Array where Element : Comparable {
    /// 快速排序
    func quickSort() -> [Element] {
        var new = self
        _qs(arr: &new, start: 0, end: new.count-1)
        return new
    }
    
    private func _qs(arr: inout [Element], start: Int, end: Int) {
//        guard start < end else { return }
//        let p = _qs_partition(arr: &arr, low: start, high: end)
//        _qs(arr: &arr, start: start, end: p-1)
//        _qs(arr: &arr, start: p+1, end: end)
        
        var low = start
        var high = end
        while low < high {
            let pivotIndex = _qs_partition(arr: &arr, low: low, high: high)
            
            // 优化：总是递归较小的部分，较大的部分使用迭代
            if pivotIndex - low < high - pivotIndex {
                _qs(arr: &arr, start: low, end: pivotIndex - 1)
                low = pivotIndex + 1
            } else {
                _qs(arr: &arr, start: pivotIndex + 1, end: high)
                high = pivotIndex - 1
            }
        }
    }
    
    private func _qs_partition(arr: inout [Element], low: Int, high: Int) -> Int {
        // 随机选择基准元素
        let randomIndex = Int.random(in: low...high)
        arr.swapAt(randomIndex, high)  // 将基准元素与最后一个元素交换
        
        let pivot = arr[high]  // 选择最后一个元素为基准元素
        var i = low - 1  // i 是小于基准元素的区域的末尾位置
        var j = low
        while j < high {
            if arr[j] < pivot {
                i += 1
                if i != j {
                    arr.swapAt(i, j)
                }
            }
            j += 1
        }
        
        arr.swapAt(i + 1, high)  // 将基准元素放到正确的位置
        return i + 1  // 返回基准元素的最终位置
    }
    
}
