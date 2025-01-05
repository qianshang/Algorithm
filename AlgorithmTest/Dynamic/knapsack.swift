/**
 4. 背包问题（0-1 背包）

 问题描述：

 有一个容量为 W 的背包，和 n 个物品，每个物品有重量 weight[i] 和价值 value[i]。在容量限制下，如何选择物品使得总价值最大？
 */

import Foundation

extension DP {
    class func knapsack(_ weight: [Int], _ value: [Int], _ capacity: Int) -> Int {
        let n = weight.count
        var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: n + 1)
        
        for i in 1...n {
            for w in 1...capacity {
                if weight[i - 1] <= w {
                    dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weight[i - 1]] + value[i - 1])
                } else {
                    dp[i][w] = dp[i - 1][w]
                }
            }
        }
        return dp[n][capacity]
    }
}
