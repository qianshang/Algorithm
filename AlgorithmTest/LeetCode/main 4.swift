// (4. 寻找两个正序数组的中位数)
/*
 给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。

 请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

 你可以假设 nums1 和 nums2 不会同时为空。

  
 示例 1:

 nums1 = [1, 3]
 nums2 = [2]

 则中位数是 2.0
 示例 2:

 nums1 = [1, 2]
 nums2 = [3, 4]

 则中位数是 (2 + 3)/2 = 2.5
 */

import Foundation

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

func findMedianSortedArrays_2(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let arr1: [Int], arr2: [Int]
    if nums1.count < nums2.count {
        arr1 = nums1
        arr2 = nums2
    } else {
        arr1 = nums2
        arr2 = nums1
    }
    let m = arr1.count
    let n = arr2.count
    var low = 0
    var high = m
    while (low <= high) {
        let i = low + Int(floor(Double(high - low) / 2))
        let j = Int(floor(Double(m + n + 1) / 2)) - i
        let maxLeftA: Int = i == 0 ? .min : arr1[i - 1]
        let minRightA: Int = i == m ? .max : arr1[i]
        let maxLeftB: Int = j == 0 ? .min : arr2[j - 1]
        let minRightB: Int = j == n ? .max : arr2[j]
        if maxLeftA <= minRightB, minRightA >= maxLeftB {
            return (m + n) % 2 == 1 ? Double(max(maxLeftA, maxLeftB)) : Double(max(maxLeftA, maxLeftB) + min(minRightA, minRightB)) / 2
        } else if maxLeftA > minRightB {
            high = i - 1
        } else {
            low = low + 1
        }
    }
    
    return 0
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

/*
checkTime { findMedianSortedArrays([1, 3], [2]) }
checkTime { findMedianSortedArrays_1([1, 3], [2]) }
checkTime { findMedianSortedArrays_2([1, 3], [2]) }

print("--")

checkTime { findMedianSortedArrays([1, 2], [3, 4]) }
checkTime { findMedianSortedArrays_1([1, 2], [3, 4]) }
checkTime { findMedianSortedArrays_2([1, 2], [3, 4]) }
*/
