/**
 * 栈
 */

import Foundation

public class Stack<T> {
    fileprivate var content: [T] = []
    public var topPointer: T? {
        return content.last
    }
    public var count: Int {
        return content.count
    }
    
    public func push(_ value: T) {
        content.append(value)
    }
    public func pop() -> T? {
        return content.popLast()
    }
    public func clear() {
        content.removeAll()
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        guard count > 0 else {
            return "|\t\(String(describing: content.last))\t|"
        }
        var text: String = ""
        for i in 1...count {
            text = text + "|\t\(content[count - i])\t|\n"
        }
        
        return text
    }
}


public func testStack() {
    print("===============Stack================")
    let stack: Stack<String> = Stack()
    
    stack.push("A")
    stack.push("B")
    stack.push("C")
    stack.push("D")
    
    print(stack)
    
    _ = stack.pop()
    print(stack)
    
    stack.clear()
    print(stack)
}

/** 运行结果
 |    D    |
 |    C    |
 |    B    |
 |    A    |
 
 |    C    |
 |    B    |
 |    A    |
 
 |    nil    |
 */
