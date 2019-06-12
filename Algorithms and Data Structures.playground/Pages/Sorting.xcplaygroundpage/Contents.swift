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

var vector = [5,3,4,9,1, 7]

insertionSort(&vector)

//MARK: - Merge Sort (Using Divide and Conquere)


//implementation for array
public func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
    if list.count < 2 {
        return list
    }
    let center = (list.count) / 2
   return merge(mergeSort([T](list[0..<center])), rightHalf: mergeSort([T](list[center..<list.count])))
}

private func merge<T: Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var tmpList = [T]()
    tmpList.reserveCapacity(leftHalf.count + rightHalf.count)
    
    while (leftIndex < leftHalf.count && rightIndex < rightHalf.count) {
        if leftHalf[leftIndex] < rightHalf[rightIndex] {
            tmpList.append(leftHalf[leftIndex])
            leftIndex += 1
        }
        else if leftHalf[leftIndex] > rightHalf[rightIndex] {
            tmpList.append(rightHalf[rightIndex])
            rightIndex += 1
        }
        else {
            tmpList.append(leftHalf[leftIndex])
            tmpList.append(rightHalf[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    tmpList += [T] (leftHalf[leftIndex..<leftHalf.count])
    tmpList += [T] (rightHalf[rightIndex..<rightHalf.count])
    return tmpList
}


var newArray = [27, 11, 5, 30, 9, 26, 18, 34]
mergeSort(newArray)


