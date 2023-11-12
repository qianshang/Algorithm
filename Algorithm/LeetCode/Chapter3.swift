/**
 3. 无重复字符的最长子串
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度
 */

import Foundation

struct Chapter3 {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map: [String.Element: Int] = [:]
        var ret: Int = 0
        var temp: Int = -1
        for (i, c) in s.enumerated() {
            if let j = map[c] {
                if temp < j { temp = j }
                let new = i - temp
                if new > ret { ret = new }
            } else {
                if i - temp > ret { ret = i - temp }
            }
            map[c] = i
        }
        return ret
    }
    
    func lengthOfLongestSubstring_1(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        var cIdx = 0
        var i = 0
        var m = 0
        for c in s {
            if let idx = map[c], idx >= cIdx {
                m = max(m, i - cIdx)
                cIdx = idx + 1
            }
            map[c] = i
            i += 1
        }
        return max(m, i - cIdx)
    }
    
}

extension Chapter3: AlgorithmTest {
    
    func testSolution() {
        checkTime { lengthOfLongestSubstring("abcabcbb") }
        checkTime { lengthOfLongestSubstring_1("abcabcbb") }
    }
    
}
