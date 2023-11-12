/**
 2. 两数相加
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 */

import Foundation

class Chapter2 {
    private var temp: Int = 0
    fileprivate func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && temp == 0 {
            return nil
        } else {
            var sum = (l1?.val ?? 0) + (l2?.val ?? 0) + temp
            if sum > 9 {
                temp = 1
                sum = sum % 10
            } else {
                temp = 0
            }
            return ListNode(sum, addTwoNumbers(l1?.next, l2?.next))
        }
    }
    
    fileprivate func addTwoNumbers_1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var carry = 0
        var l1 = l1
        var l2 = l2
        var cur = dummy
        while l1 != nil || l2 != nil || carry != 0 {
            let s = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = s / 10
            cur.next = ListNode(s % 10)
            cur = cur.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        return dummy.next
    }
}

extension Chapter2: AlgorithmTest {
    func testSolution() {
        _ = {
            let l1: ListNode? = ListNode.create([2,4,3])
            let l2: ListNode? = ListNode.create([5,6,4])
            // [7,0,8]
            checkTime { addTwoNumbers(l1, l2) }
            
            checkTime { addTwoNumbers_1(l1, l2) }
        }()
        _ = {
            let l1: ListNode? = ListNode.create([9,9,9,9,9,9,9])
            let l2: ListNode? = ListNode.create([9,9,9,9])
            // [8,9,9,9,0,0,0,1]
            checkTime { addTwoNumbers(l1, l2) }
            
            checkTime { addTwoNumbers_1(l1, l2) }
        }()
    }
}

fileprivate final class ListNode: CustomDebugStringConvertible {
    var val: Int
    var next: ListNode?
    init() {
        self.val = 0
        self.next = nil
    }
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    class func create(_ arr: [Int]) -> ListNode? {
        var ret: ListNode? = nil
        var temp: ListNode? = nil
        var a: [Int] = arr
        while !a.isEmpty {
            let e = a.removeFirst()
            let n = ListNode(e)
            if let t = temp {
                t.next = n
            } else {
                ret = n
            }
            temp = n
        }
        return ret
    }
    
    var debugDescription: String {
        var ret: String = "\(val)"
        var ee = self
        while let e = ee.next {
            ret += "->\(e.val)"
            ee = e
        }
        return ret
    }
}
