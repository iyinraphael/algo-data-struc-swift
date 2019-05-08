import Foundation

//MARK: - Stack Last In First Out (LIFO) data structure.
//method: push, pop and peek

public struct Stack<T> {
    private var elements = [T]()
    public init() {}
    
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    public func peek() -> T? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return self.elements.count
    }
}

var myStack = Stack<Int>()

myStack.push(5)
myStack.push(44)
myStack.push(23)

var x = myStack.pop()
x = myStack.pop()
x = myStack.pop()
x = myStack.pop()

extension Stack: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return self.elements.description //this protocol allows you to return a friendly name whenever you print
    }
    
    public var debugDescription: String {
        return self.elements.debugDescription
    }
    
    
}

extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: T...) {
        self.init()
    }
}

public struct ArrayIterator<T> : IteratorProtocol {
    var currentElement: [T]
    
    init(elements: [T]) {
        self.currentElement = elements
    }
    
    mutating public func next() -> T? {
        if (!self.currentElement.isEmpty) {
            return self.currentElement.popLast()
        }
        return nil
    }
}

extension Stack: Sequence {
    public func makeIterator() -> ArrayIterator<T> {
        return ArrayIterator<T>(elements: self.elements)
    }
    
    public init <S : Sequence>(_ s: S) where S.Iterator.Element == T {
        self.elements = Array(s.reversed())
    }
}

var my2Stack = [4,5,6,7]

var myStackFromStack = Stack<Int>(my2Stack)
myStackFromStack.push(55)
myStackFromStack.push(70)
my2Stack



