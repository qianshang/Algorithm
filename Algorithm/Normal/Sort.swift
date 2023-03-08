/**
 * 排序
 */

import Foundation

/// 选择排序
func sortSelect(with arr: [Int]) -> [Int] {
    let count = arr.count
    var res = arr
    var min: Int = 0
    
    for i in 0..<count {
        min = i
        for j in (i+1)..<count {
            if res[min] > res[j] {
                min = j
            }
        }
        
        if min != i {
            res.swapAt(i, min)
        }
    }
    
    return res
}

/// 插入排序
func sortInsert(with arr: [Int]) -> [Int] {
    var res = arr
    for x in 1..<res.count {
        var y = x
        let temp = res[y]
        while y > 0 && temp < res[y - 1] {
            res[y] = res[y - 1]
            y -= 1
        }
        res[y] = temp
    }
    return res
}

///
func sortShell(with arr: [Int]) -> [Int] {
    var a = arr
    let n = a.count-1
    
    var gap = n / 2
    while gap > 0 {
        for j in gap...n {
            if a[j] < a[j-gap]{
                let tmep = a[j]
                var k = j - gap
                while k >= 0 && a[k] > tmep {//扫一遍 好填最小值
                    a[k + gap] = a[k]
                    k -= gap
                }
                a[k + gap] = tmep
            }
        }
        gap /= 2
    }
    return a
}

/// 堆排序
func sortHeap(with arr: [Int]) -> [Int] {
    // 构建一个大顶堆
    func buildheap( arr: inout [Int]) {
        let length = arr.count
        let heapsize = length
        var nonleaf = length / 2 - 1
        while nonleaf >=  0 {
            heapify(arr: &arr, i: nonleaf, heapsize: heapsize)
            nonleaf -= 1
        }
        
    }
    
    // 使节点值大于其孩子节点
    func heapify(arr: inout [Int], i : Int, heapsize: Int){
        var index = i
        let left = 2*i+1
        let right = 2*i+2
        
        // 找出左中右三个值中最大值的下标
        if left < heapsize, arr[i] < arr[left] {
            index = left
        }
        if right < heapsize, arr[index] < arr[right] {
            index = right
        }
        
        
        if(index != i){
            var temp: Int
            temp = arr[i]
            arr[i] = arr[index]
            arr[index] = temp
            heapify(arr: &arr,i: index,heapsize: heapsize)
        }
        
    }
    
    func internalHeapSort( arr: inout [Int]) {
        var heapsize = arr.count
        buildheap(arr: &arr)
        for _ in 0 ..< arr.count - 1 {
            var temp: Int
            temp = arr[0]
            arr[0] = arr[heapsize - 1]
            arr[heapsize - 1] = temp
            heapsize = heapsize - 1
            heapify(arr: &arr, i: 0, heapsize: heapsize)
        }
    }
    
    var res = arr
    internalHeapSort(arr: &res)
    return res
}

/// 归并排序
func sortMerge(with arr: [Int]) -> [Int] {
    func merge (_ arr:inout [Int], low: Int, mid: Int, high: Int, temp:inout [Int]) {
        var i = low
        var j = mid + 1
        let m = mid
        let n = high
        var k = 0
        
        while (i <= m && j <= n) {
            if (arr[i] <=  arr[j]) {
                temp[k] = arr[i]
                k += 1
                i += 1
            } else {
                temp[k] = arr[j]
                k += 1
                j += 1
            }
        }
        
        while i <= m {
            temp[k] = arr[i]
            k += 1
            i += 1
        }
        
        while j <=  n {
            temp[k] = arr[j]
            k += 1
            j += 1
        }
        
        for f in 0 ..< k {
            arr[low + f] = temp[f]
        }
        
    }
    
    func internalMergeSort(_ arr:inout [Int], low: Int, high: Int, temp:inout [Int]) {
        if high <= low {
            return
        }
        let mid = low + (high - low) / 2
        // 左边有序
        internalMergeSort(&arr, low: low, high: mid, temp: &temp)
        // 右边有序
        internalMergeSort(&arr, low: mid + 1, high: high, temp: &temp)
        // 将两边合起来
        merge(&arr, low: low, mid: mid, high: high, temp: &temp)
    }
    
    var res = arr
    var temp: [Int] = res
    internalMergeSort(&res, low: 0, high: arr.count - 1, temp: &temp)
    return res
}

/// 快速排序
func sortQuick(with arr: [Int]) -> [Int] {
    func partition(_ arr: inout [Int], _ p: Int, _ r: Int) -> Int {
        var i = p - 1
        let key = arr[r]
        for j in p ..< r {
            if arr[j] < key {
                i = i + 1
                let temp = arr[j]
                arr[j] = arr[i]
                arr[i] = temp
            }
        }
        arr[r] = arr[i + 1]
        arr[i + 1] = key
        return i + 1
    }
    
    func internalQuickSort(_ arr: inout [Int], _ p: Int, _ r: Int) {
        if p < r {
            let q = partition(&arr, p, r)
            internalQuickSort(&arr, p, q - 1)
            internalQuickSort(&arr, q + 1, r)
        }
    }
    
    
    var res = arr
    internalQuickSort(&res, 0, res.count - 1)
    return res
}

public func testSort() {
    let count: Int = 10000
    print("针对容量为\(count)的整数数组进行排序")
    var arr: [Int] = []
    deal("create") {
        for _ in 0..<count {
            arr.append(Int(arc4random() % 1000))
        }
        return arr
    }
    deal("select") { sortSelect(with: arr) }
    deal("insert") { sortInsert(with: arr) }
    deal("shell") { sortShell(with: arr) }
    deal("heap") { sortHeap(with: arr) }
    deal("merge") { sortMerge(with: arr) }
    deal("quick") { sortQuick(with: arr) }
}

public func deal(_ name: String, handler: ()->[Int]) {
    let date = Date()
    
    let res = handler()
    
    let time = Date().timeIntervalSince(date) * 1000
    print(String(format: "%@\t用时:%.1fms\t校验:%@", name, time, check(for: res) ?"✅":"❌"))
}

func check(for arr: [Int]) -> Bool {
    guard var previous: Int = arr.first else { return true }
    for i in 1..<arr.count {
        if previous > arr[i] {
            return false
        }
        previous = arr[i]
    }
    return true
}
