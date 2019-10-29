//import Foundation
//
//
//struct FixedSizeArray<T> {
//    var maxSize: Int
//    private var defaultValue: T
//    private var array: [T]
//    private (set) var count = 0
//
//    init(maxSize: Int, defaultValue: T) {
//        self.maxSize = maxSize
//        self.defaultValue = defaultValue
//        self.array = [T](repeating: defaultValue, count: maxSize)
//    }
//    
//    subscript(index: Int) -> T {
//        assert(index >= 0)
//        assert(index < count)
//        return array[index]
//    }
//
//    mutating func append(_ newElement: T) {
//        assert(count < maxSize)
//        array[count] = newElement
//        count += 1
//    }
//
//    mutating func removeAt(index: Int) -> T {
//        assert(index >= 0)
//        assert(index < count)
//        count -= 1
//        let result = array[index]
//        array[index] = array[count]
//        array[count] = defaultValue
//        return result
//    }
//
//    mutating func removeAll() {
//        for i in 0..<count {
//            array[i] = defaultValue
//        }
//        count = 0
//    }
//}
//
//
//class MyCircularQueue {
//
//    /** Initialize your data structure here. Set the size of the queue to be k. */
//
//    var circularBuffer: FixedSizeArray<Int>
//
//    init(_ k: Int) {
//
//        circularBuffer = FixedSizeArray(maxSize: k, defaultValue: 0)
//
//    }
//
//
//    /** Insert an element into the circular queue. Return true if the operation is successful. */
//    func enQueue(_ value: Int) -> Bool {
//
//        if circularBuffer.count == circularBuffer.maxSize {
//            return false
//        }
//
//        circularBuffer.append(value)
//        return true
//    }
//
//    /** Delete an element from the circular queue. Return true if the operation is successful. */
//    func deQueue() -> Bool {
//        circularBuffer.removeAt(index: 0)
//        return true
//    }
//
//    /** Get the front item from the queue. */
//    func Front() -> Int {
//        if circularBuffer.isEmpty {
//            return -1
//        }
//        let front = circularBuffer[0]
//
//        return front
//    }
//
//    /** Get the last item from the queue. */
//    func Rear() -> Int {
//        if circularBuffer.isEmpty {
//            return -1
//        }
//
//        let index = circularBuffer.count - 1
//        let back = circularBuffer[index]
//
//        return back
//    }
//
//    /** Checks whether the circular queue is empty or not. */
//    func isEmpty() -> Bool {
//        return circularBuffer.isEmpty
//    }
//
//    /** Checks whether the circular queue is full or not. */
//    func isFull() -> Bool {
//        return circularBuffer.count == circularBuffer.capacity
//    }
//
//}
//
// //Your MyCircularQueue object will be instantiated and called as such:
//
//let newObj = MyCircularQueue(8)
//let ret_a: Bool = newObj.enQueue(1)
//let ret_b: Bool = newObj.enQueue(2)
//let ret_c: Bool = newObj.enQueue(3)
//let ret_d: Bool = newObj.enQueue(4)
//let ret_e: Int = newObj.Rear()
//let ret_f: Bool = newObj.isFull()
//let ret_g: Bool = newObj.deQueue()
//let ret_h: Bool = newObj.enQueue(4)
//let ret_i: Int = newObj.Rear()
//
//print(newObj.capacity)
//
//
