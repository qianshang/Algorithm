//
//  Array+HeapSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2024/12/23.
//

import Foundation

extension Array where Element: Comparable {
    /// 堆排序
    func heapSort() -> [Element] {
        var new = self
        let n = new.count
        
        // 建立最大堆
        for i in (0...(n / 2 - 1)).reversed() {
            heapify(&new, n: n, i: i)
        }
        
        // 进行堆排序
        for i in (1..<n).reversed() {
            // 交换根节点和当前最后一个元素
            new.swapAt(0, i)
            
            // 对根节点进行堆化
            heapify(&new, n: i, i: 0)
        }
        
        return new
    }
    
    // 堆化操作：将根节点调整为最大堆
    private func heapify(_ arr: inout [Element], n: Int, i: Int) {
        var largest = i  // 当前节点
        let left = 2 * i + 1  // 左子节点
        let right = 2 * i + 2  // 右子节点
        
        // 如果左子节点比当前节点大
        if left < n && arr[left] > arr[largest] {
            largest = left
        }
        
        // 如果右子节点比当前节点大
        if right < n && arr[right] > arr[largest] {
            largest = right
        }
        
        // 如果最大值不是当前节点
        if largest != i {
            arr.swapAt(i, largest)  // 交换
            
            // 递归堆化
            heapify(&arr, n: n, i: largest)
        }
    }
}
