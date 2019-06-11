//MARK: - Insertion Sort Algorithm 0(n2) good for small dataset

public func insertionSort<T: Comparable>(_ list: inout [T]){
    if list.count <= 1 {
        return
    }
    for i in 1..<list.count {
        let x = list[i]
        var j = i
        while j > 0 && list[j - 1] > x {
            list[j] = list[j - 1]
            j -= 1
        }
        list[j] = x
    }
}


