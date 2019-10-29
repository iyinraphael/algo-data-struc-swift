

import Foundation

// MARK: IteratorProtocol - The sole purpose of IteratorProtocol is to encapsulate the iteration state of a collection by providing the next() method
public protocol IteratorProtocol {
    ///The type of element traversed by the iterator.
    associatedtype Element
    /// Returns: The next element in the underlying sequesnce if next element exist; otherwise, nil
    mutating func next () -> Self.Element?
}


// MARK: Sequence - It's the factory that produces iteratorProtocol depending on the type of collection
public protocol Sequence {
    ///A type that provides the sequence's iteration interface and encapsulates it's state
    associatedtype Iterator : IteratorProtocol
    /// Returns an iterator over the elements of this seqeunce.
    func makeIterator () -> Self.Iterator
}

/*Hint
    associatedtype allow you declare one or more types that are not known until the protocol is adopted. In Swift this is how we can implemetn genenrics
 */

// MARK: Collections - is a Sequence and also conforms to the Indexable protocol. The minimum requirment for conformance to the Collection protocol is your type must declare startIndex and endIndex properties, index(after:) method used to advance an index in the collection and subscript that provides at least read-only access to your type's element.
