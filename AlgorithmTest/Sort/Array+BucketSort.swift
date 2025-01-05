//
//  Array+BucketSort.swift
//  AlgorithmTest
//
//  Created by 程维 on 2024/12/28.
//

import Foundation

extension Array where Element: Comparable & SignedNumeric {
    /// 桶排序
    func bucketSort(bucketCount: Int) -> [Element] {
        guard !self.isEmpty, bucketCount > 0 else { return self } // 空数组直接返回
        
        // 找到数组中的最大值和最小值
        guard let minElement = self.min(), let maxElement = self.max() else {
            return self
        }
        
        let range = (maxElement - minElement).toInt  // 数据范围
        let bucketSize = range / bucketCount // 每个桶的范围
        
        // 初始化桶
        var buckets: [[Element]] = Array<[Element]>(repeating: [], count: bucketCount)
        
        // 将元素分配到桶中
        for num in self {
            let bucketIndex = ((num - minElement).toInt / bucketSize)
            let validIndex = bucketIndex < bucketCount ? bucketIndex : bucketCount - 1 // 避免越界
            buckets[validIndex].append(num)
        }
        
        // 对每个桶内的元素进行排序
        var sortedArray: [Element] = []
        for bucket in buckets {
            sortedArray.append(contentsOf: bucket.sorted()) // 使用内置排序
        }
        
        return sortedArray
    }
    
}

extension SignedNumeric {
    fileprivate var toInt: Int {
        if let e = self as? Int {
            return e
        } else if let e = self as? Double {
            return Int(e)
        } else if let e = self as? Float {
            return Int(e)
        } else {
            fatalError("不支持的类型")
        }
    }
}
