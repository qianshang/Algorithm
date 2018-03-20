//
//  Tree.swift
//  Algorithm
//
//  Created by mac on 2018/3/19.
//  Copyright © 2018年 mac. All rights reserved.
//

import Foundation

fileprivate class Node<T> {
    var value: T
    var children: [Node<T>] = []
    weak var parent: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func addChild(with value: Node<T>) -> Node {
        children.append(value)
        value.parent = self
        return self
    }
    
    func addChilds(with values: [Node<T>]) -> Node {
        children.append(contentsOf: values)
        values.forEach { $0.parent = self }
        return self
    }
    
    func query(for key: String) -> Node? {
        if (self.value as! String) == key {
            return self
        } else {
            for child in children {
                if let res = child.query(for: key) {
                    return res
                }
            }
            
            return nil
        }
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += "\n{\n" + children.map { $0.description }.joined(separator: ",\n") + "\n}"
        }
        return text
    }
}

public func testTree() {
    print("===============Tree================")
    
    let tree = Node(value: "tree")
        .addChild(with: Node(value: "child1")
            .addChild(with: Node(value: "11")))
        .addChilds(with: [Node(value: "child2"),
                          Node(value: "child3"),
                          Node(value: "child4"),
                          Node(value: "child5")])
    
    print(tree)
    
    if let res = tree.query(for: "child3") {
        print(res)
    }
}
