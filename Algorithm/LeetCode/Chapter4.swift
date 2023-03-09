/**
 4. 寻找两个正序数组的中位数
 
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
 */

import Foundation

struct Chapter4 {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let c: Float = Float(nums1.count + nums2.count) / 2
        var m: Int = 0
        var i: Int = 0
        var j: Int = 0
        var t: Float = 0
        while true {
            if t == c || t > {
                
            }
        }
    }
    
}

extension Chapter4: AlgorithmTest {
    func testSolution() {
        print(findMedianSortedArrays([1, 3], [2]))
        print(findMedianSortedArrays([1,2], [3,4]))
    }
}

//输入：nums1 = [1,3], nums2 = [2]
//输出：2.00000
//解释：合并数组 = [1,2,3] ，中位数 2
//示例 2：
//
//输入：nums1 = [1,2], nums2 = [3,4]
//输出：2.50000
//解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
