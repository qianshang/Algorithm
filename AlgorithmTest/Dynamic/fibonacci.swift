/**
 1. 斐波那契数列

 问题描述：

 计算第 n 个斐波那契数，满足递归关系：
 f(n) = f(n-1) + f(n-2)，且 f(0) = 0, f(1) = 1。
 */

import Foundation

extension DP {
    /// 第n位的斐波那契数
    class func fibonacciOptimized(_ n: Int) -> Int {
        guard n >= 0 else { return 0 }
        if n <= 1 { return n }
        
        var prev1 = 0, prev2 = 1
        var i = 2
        while i <= n {
            let current = prev1 + prev2
            prev1 = prev2
            prev2 = current
            i += 1
        }
        return prev2
    }
}
