/**
 1. 两数之和
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
 */
import Foundation

struct Chapter1 {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        let ct: Int = nums.count
//        for i in 0..<(ct - 1) {
//            let a: Int = nums[i]
//            for j in (i+1)..<ct {
//                let b: Int = nums[j]
//                if a + b == target {
//                    return [i, j]
//                } else {
//                    continue
//                }
//            }
//        }
//        return []
        
//        var map: [Int: Int] = [:]
//        for i in 0..<nums.count {
//            let e = target - nums[i]
//            if let n = map[e] {
//                return [n, i]
//            } else {
//                map[nums[i]] = i
//            }
//        }
//        return []
        
        var map: [Int: Int] = [:]
        for (i, v) in nums.enumerated() {
            if let e = map[v] {
                return [e, i]
            } else {
                map[target - v] = i
            }
        }
        return []
    }
    
}

extension Chapter1: AlgorithmTest {
    func testSolution() {
        func test(_ arr: [Int], _ t: Int, _ res: [Int]) {
            let ee = twoSum(arr, t)
            if ee.isEqual(res) {
                print(arr, t, "✅")
            } else {
                print(arr, t, "❌", ee)
            }
        }
        
        test(
            [2, 7, 11, 15],
            9,
            [0, 1]
        )
        test(
            [3, 2, 4],
            6,
            [1, 2]
        )
    }
}

private extension Array where Element == Int {
    func isEqual(_ rhs: [Element]) -> Bool {
        let e1: [Int] = self.sorted(by: <)
        let e2: [Int] = rhs.sorted(by: <)
        guard e1.count == e2.count else { return false }
        for i in 0..<e1.count {
            if e1[i] != e2[i] {
                return false
            } else {
                continue
            }
        }
        return true
    }
}
