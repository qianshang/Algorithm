import Foundation

final class DP {
    
    private init() { }
    
    class func test() {
        for i in 1..<50 {
            checkTime(tag: "\(i)", { fibonacciOptimized(i) })
        }
    }
    
}
