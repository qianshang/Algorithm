/**
 4. 寻找两个正序数组的中位数
 
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
 */

import Foundation

struct Chapter4 {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var a: [Int] = []
        var i: Int = 0
        var j: Int = 0
        let t: Int = nums1.count + nums2.count
        while (i + j) < t {
            if i >= nums1.count {
                a.append(contentsOf: nums2[j...])
                break
            } else if j >= nums2.count {
                a.append(contentsOf: nums1[i...])
                break
            } else if nums1[i] <= nums2[j] {
                a.append(nums1[i])
                i += 1
            } else {
                a.append(nums2[j])
                j += 1
            }
        }
        
        return a.middle
    }
    
    
    func findMedianSortedArrays_1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        func f(_ i: Int, _ j: Int, _ k: Int) -> Int {
            if (i >= m) {
                return nums2[j + k - 1]
            }
            if (j >= n) {
                return nums1[i + k - 1]
            }
            if (k == 1) {
                return min(nums1[i], nums2[j])
            }
            let p = Int(floor(Double(k) / 2))
            let x = i + p - 1 < m ? nums1[i + p - 1] : 1 << 30
            let y = j + p - 1 < n ? nums2[j + p - 1] : 1 << 30
            return x < y ? f(i + p, j, k - p) : f(i, j + p, k - p)
        }
        let a = f(0, 0, Int(floor(Double(m + n + 1) / 2)))
        let b = f(0, 0, Int(floor(Double(m + n + 2) / 2)))
        return Double(a + b) / 2
    }
}

extension Array where Element == Int {
    var middle: Double {
        guard count > 0 else { return 0 }
        guard count > 1 else { return Double(self[0]) }
        if count % 2 == 0 {
            let i = count / 2
            let j = i - 1
            return Double(self[i] + self[j]) / 2
        } else {
            return Double(self[count / 2])
        }
    }
}

extension Chapter4: AlgorithmTest {
    func testSolution() {
        checkTime { findMedianSortedArrays([1, 3], [2]) }
        checkTime { findMedianSortedArrays_1([1, 3], [2]) }
        
        checkTime { findMedianSortedArrays([1, 2], [3, 4]) }
        checkTime { findMedianSortedArrays_1([1, 2], [3, 4]) }
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
