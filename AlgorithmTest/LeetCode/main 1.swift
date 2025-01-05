// (1. 两数之和)
/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */

import Foundation

func twoSum_1(_ nums: [Int], _ target: Int) -> [Int] {
    let ct: Int = nums.count
    for i in 0..<(ct - 1) {
        let a: Int = nums[i]
        for j in (i+1)..<ct {
            let b: Int = nums[j]
            if a + b == target {
                return [i, j]
            } else {
                continue
            }
        }
    }
    return []
}

func twoSum_2(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for i in 0..<nums.count {
        let e = target - nums[i]
        if let n = map[e] {
            return [n, i]
        } else {
            map[nums[i]] = i
        }
    }
    return []
}

func twoSum_3(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for (i, v) in nums.enumerated() {
        if let e = map[target - v] {
            return [e, i]
        } else {
            map[v] = i
        }
    }
    return []
}

func twoSum_4(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    var i = 0
    while i < nums.count {
        if let j = map[target - nums[i]] {
            return [j, i]
        } else {
            map[nums[i]] = i
            i += 1
        }
    }
    return []
}


//let nums: [Int] = [2, 7, 11, 15]
//let target: Int = 9
//
//checkTime { twoSum_1(nums, target) }
//checkTime { twoSum_2(nums, target) }
//checkTime { twoSum_3(nums, target) }
//checkTime { twoSum_4(nums, target) }
