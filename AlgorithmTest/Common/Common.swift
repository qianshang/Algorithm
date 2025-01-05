

import Foundation

public func checkTime<T>(tag: String = "", _ handle: () -> T) {
    let start: TimeInterval = CFAbsoluteTimeGetCurrent()
    let ret = handle()
    let used = (CFAbsoluteTimeGetCurrent() - start)
    if tag.isEmpty {
        print("\(ret)\t\t\(used.toString)")
    } else {
        print("\(tag)\t\t\(ret)\t\t\(used.toString)")
    }
}

extension TimeInterval {
    var toString: String {
        if self >= 1.0 {
            return String(format: "%.3fs", ceil(self * 1_000) / 1000)
        } else if self >= 0.001 {
            return String(format: "%.3fms", ceil(self * 1_000_000) / 1000)
        } else if self >= 0.000_001 {
            return String(format: "%.3fus", ceil(self * 1_000_000_000) / 1000)
        } else {
            return String(format: "%.3fns", ceil(self * 1_000_000_000_000) / 1000)
        }
        
    }
}
