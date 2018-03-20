//
//  LinkedList.swift
//  Algorithm
//
//  Created by mac on 2018/3/16.
//  Copyright © 2018年 mac. All rights reserved.
//

import Foundation

fileprivate class Node {
    var value: String
    
    weak var previous: Node?
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}


public class LinkedList {
    fileprivate var head: Node?
    private var tail: Node?
    private var count: Int = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    fileprivate var first: Node? {
        return head
    }
    
    fileprivate var last: Node? {
        return tail
    }
    
    public var length: Int {
        return count
    }
    
    public func append(value: String) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
        count += 1
    }
    
    public func insert(value: String, at index: Int) {
        if index <= 0 {
            let newNode = Node(value: value)
            
            newNode.next = head
            head?.previous = newNode
            head = newNode
            count += 1
            
            return
        }
        if let node = getNode(at: index)?.previous {
            let newNode = Node(value: value)
            
            node.next?.previous = newNode
            
            newNode.next = node.next
            newNode.previous = node
            
            node.next = newNode
            
            if index == count { tail = newNode }
            count += 1
        } else {
            append(value: value)
        }
    }
    
    public func deleteNode(at index: Int) -> Bool {
        if let node = getNode(at: index) {
            if let pre = node.previous {
                pre.next = node.next
                node.next?.previous = pre
            } else {
                head = node.next
                head?.previous = nil
            }
            
            count -= 1
            return true
        } else {
            return false
        }
    }
    
    fileprivate func getNode(at index: Int) -> Node? {
        guard index >= 0 && index <= count else { return nil }
        
        
        var node = head
        var idx: Int = 0
        
        while (idx < index) {
            node = node?.next
            idx += 1
        }
        
        return node
    }
    
    public func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    
    public func reverse() {
        var node = head
        tail = node
        
        while node != nil {
            let n = node
            let p = n?.next
            n?.next = n?.previous
            n?.previous = p
            head = n
            node = n?.previous
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = ""
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += "->" }
        }
        
        return text
    }
    
    public func printSelf() {
        print("list(\(count)): \(description)")
    }
}

public func testLinkedList() {
    print("===============LinkedList================")
    
    let dogBreeds = LinkedList()
    dogBreeds.append(value: "Labrador")
    dogBreeds.append(value: "Bulldog")
    dogBreeds.append(value: "Beagle")
    dogBreeds.append(value: "Husky")
    
    dogBreeds.printSelf()
    
    dogBreeds.reverse()
    dogBreeds.printSelf()
    
    dogBreeds.insert(value: "Android", at: 4)
    dogBreeds.printSelf()
    
    dogBreeds.insert(value: "Swift", at: 2)
    dogBreeds.printSelf()
    
    _ = dogBreeds.deleteNode(at: 2)
    dogBreeds.printSelf()
    
    dogBreeds.removeAll()
    dogBreeds.printSelf()
}

/** 运行结果
 list(4): Labrador->Bulldog->Beagle->Husky
 list(4): Husky->Beagle->Bulldog->Labrador
 list(5): Husky->Beagle->Bulldog->Labrador->Android
 list(6): Husky->Beagle->Swift->Bulldog->Labrador->Android
 list(5): Husky->Beagle->Bulldog->Labrador->Android
 list(0):
 */
