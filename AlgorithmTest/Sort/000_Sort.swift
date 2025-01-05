import Foundation

final class SP {
    
    private init() { }
    
    class func test() {
        let arr: [Int] = (1...1000_000).map({_ in return Int.random(in: 1...10000)})

//        checkTime(tag: "选择排序", { _ = arr.selectSort() })
//        checkTime(tag: "插入排序", { _ = arr.insertSort() })
        checkTime(tag: "快速排序", { _ = arr.quickSort() })
        checkTime(tag: "归并排序1", { _ = arr.mergeSort() })
        checkTime(tag: "归并排序2", { _ = arr.mergeSortIterative() })
        checkTime(tag: "堆排序", { _ = arr.heapSort() })
        checkTime(tag: "计数排序", { _ = arr.countingSort() })
        checkTime(tag: "前缀排序", { _ = arr.radixSort() })
        checkTime(tag: "桶排序", { _ = arr.bucketSort(bucketCount: 3) })
    }
    
}
