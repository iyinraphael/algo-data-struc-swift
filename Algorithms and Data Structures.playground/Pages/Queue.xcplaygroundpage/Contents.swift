
import Foundation

/** MARK :- Queue is a FIFO data Structure and implements the following seven operations
 
 - enqueue() - Adds an element to the back of the queue
 - dequeue() - Removes and returns the first element from the queue
 - peek()  - Returns first element of the queue but doesn't remove it
 - clear() - Resets the queue to an empty state
 - count - Returns the number of elements in the queue
 - isEmpty() - Returns true if the queue is empty and false otherwise
 - isFull() - Returns try if the queue is full and flase otherwise
 
 Implemetation are:
 
 - capacity - A read/write prperty for retrieving or setting the queue capacity
 - insert(_ :atIndex) - A method that inserts an element at an index specified
 Tips
 
 Array.capacity returns how many elements it can hold, while Array.count returns how many elements in the array
 
 **/

public struct Queue<T> {
    private var data = Array<T>()
    
    public init() {}
    
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
        data.append(contentsOf: elements)
    }
    
    public mutating func deque() -> T? {
        return data.removeFirst()
    }
    
    public func peek() -> T? {
        return data.first
    }
    
    //MARK:- Helpers for a Circular Buffer
    public mutating func clear() {
        data.removeAll()
    }
    
    public mutating func enqueue(_ element: T) {
        data.append(element)
    }
    
    public var count: Int {
        return data.count
    }
    
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
}

var queue = Queue<Int>()
queue.capacity = 4

queue.enqueue(5)
queue.enqueue(13)
queue.enqueue(8)
queue.enqueue(2)
queue.enqueue(10)


print(queue.capacity)

var newQueue = Queue<Int>()
newQueue.capacity = 6



newQueue.enqueue(5)
newQueue.enqueue(6)
newQueue.enqueue(7)
newQueue.enqueue(8)
newQueue.enqueue(9)
newQueue.enqueue(10)

print(newQueue.isFull())
print(newQueue.capacity)

//let x = queue.deque()
//let y = queue.peek()
//let z = queue.deque()

extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return data.description
    }
    
    public var debugDescription: String {
        return data.debugDescription
    }
}

extension Queue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}


//MARK :-  Priority Queue is like a regular queue except each element has a priority assigned to it.
/**
 Elements that have a higher priority are dequeued before lower priortiy elements.  
 **/





