import UIKit

var array1 = [8,3,7,12,6,9,10]
var sortedArray1 = [4,8,13,16,20,25,28,33]
var sortedArray2 = [1,2,3,5,7]
var negativeArray1 = [-6,3,-8,10,5,-7,-9,12,-4,2]
var singleMissingSortedArray1 = [6,7,8,9,10,11,13,14,15,16,17]
var multipleMissingSortedArray1 = [6,7,8,9,11,12,15,16,17]
var duplicateSortedArray1 = [3,6,8,8,10,12,15,15,15,20]
var duplicateUnsortedArray1 = [8,3,6,4,6,5,6,8,2,7]
var radixArray1 = [170,45,75,90,802,24,2,66]
var bucketArray1 = [0.1234,0.3434,0.565,0.656,0.665,0.897]

func insertElement(index: Int, element: Int) {
    print("Entered Array is", array1)
    let lastElement = array1[array1.count - 1]
    var lastIndex = array1.count - 1
    while(index < lastIndex) {
        array1[lastIndex] = array1[lastIndex - 1]
        lastIndex -= 1
    }
    array1[index] = element
    array1.append(lastElement)
    print("Array after inserting the element is", array1)
}

//insertElement(index: 4, element: 15)

func deleteElement(index: Int) {
    print("Entered Array is", array1)
    let lastIndex = array1.count - 1
    var elementIndex = index
    while(elementIndex < lastIndex) {
        array1[elementIndex] = array1[elementIndex + 1]
        elementIndex += 1
    }
    array1.removeLast()
    print("Array after deleting the element is", array1)
}

//deleteElement(index: 4)

func reverseElement() {
    print("Entered Array is", array1)
    var firstIndex = 0
    var lastIndex = array1.count - 1
    while(firstIndex < lastIndex) {
        let temp = array1[firstIndex]
        array1[firstIndex] = array1[lastIndex]
        array1[lastIndex] = temp
        firstIndex += 1
        lastIndex -= 1
    }
    print("Array after reverse the element is", array1)
}

//reverseElement()

func leftRotate(times: Int) {
    print("Entered Array is", array1)
    var firstIndex = 0
    let lastIndex = array1.count - 1
    while(firstIndex < times) {
        let temp = array1[0]
        var firstJindex = 0
        while(firstJindex < lastIndex) {
            array1[firstJindex] = array1[firstJindex+1]
            firstJindex += 1
        }
        array1.removeLast()
        array1.append(temp)
        firstIndex += 1
    }
    print("Array after left rotating the element is", array1)
}

//leftRotate(times: 2)

func insertElementIntoSortedArray(element: Int) {
    print("Entered Array is", sortedArray1)
    let lastElement = sortedArray1[sortedArray1.count - 1]
    var lastIndex = sortedArray1.count - 1
    while(sortedArray1[lastIndex] > element) {
        sortedArray1[lastIndex] = sortedArray1[lastIndex - 1]
        lastIndex -= 1
    }
    sortedArray1[lastIndex+1] = element
    sortedArray1.append(lastElement)
    print("Array after inserting the element is", sortedArray1)
}

//insertElementIntoSortedArray(element: 18)

func whetherArraySorted() {
    print("Entered Array is", sortedArray1)
    var firstIndex = 0
    let lastIndex = sortedArray1.count - 1
    while(firstIndex < lastIndex) {
        if sortedArray1[firstIndex] > sortedArray1[firstIndex + 1] {
            print("Array is not sorted")
            break
        }
        firstIndex += 1
    }
}

//whetherArraySorted()

func negativeNumberOnLeftSide() {
    print("Entered Array is", negativeArray1)
    var firstIndex = 0
    var lastIndex = negativeArray1.count - 1
    while(firstIndex < lastIndex) {
        while(negativeArray1[firstIndex] < 0) {
            firstIndex += 1
        }
        while(negativeArray1[lastIndex] >= 0) {
            lastIndex -= 1
        }
        if firstIndex < lastIndex {
            let temp = negativeArray1[firstIndex]
            negativeArray1[firstIndex] = negativeArray1[lastIndex]
            negativeArray1[lastIndex] = temp
        }
    }
    print("Array is", negativeArray1)
}

//negativeNumberOnLeftSide()

func singleMissingElementFromSortedArray() {
    print("Entered Array is", singleMissingSortedArray1)
    let difference = singleMissingSortedArray1[0]
    var firstIndex = 0
    let lastIndex = singleMissingSortedArray1.count - 1
    while(firstIndex < lastIndex) {
        if (singleMissingSortedArray1[firstIndex] - firstIndex) != difference {
            print("Missing element is", firstIndex + difference)
            break
        }
        firstIndex += 1
    }
}

//singleMissingElementFromSortedArray()

func multipleMissingElementFromSortedArray() {
    print("Entered Array is", multipleMissingSortedArray1)
    var difference = multipleMissingSortedArray1[0]
    var firstIndex = 0
    let lastIndex = multipleMissingSortedArray1.count - 1
    while(firstIndex < lastIndex) {
        if (multipleMissingSortedArray1[firstIndex] - firstIndex) != difference {
            while(difference < (multipleMissingSortedArray1[firstIndex] - firstIndex)) {
                print("Missing elements are", firstIndex + difference)
                difference += 1
            }
        }
        firstIndex += 1
    }
}

//multipleMissingElementFromSortedArray()

func duplicateInSortedArray() {
    print("Entered Array is", duplicateSortedArray1)
    var lastDuplicate = 0
    var firstIndex = 0
    let lastIndex = duplicateSortedArray1.count - 1
    while(firstIndex < lastIndex) {
        if (duplicateSortedArray1[firstIndex] == duplicateSortedArray1[firstIndex + 1] && duplicateSortedArray1[firstIndex] != lastDuplicate) {
            print("Duplicate elements are", duplicateSortedArray1[firstIndex])
            lastDuplicate = duplicateSortedArray1[firstIndex]
        }
        firstIndex += 1
    }
}

//duplicateInSortedArray()

func duplicateUnSortedArray() {
    print("Entered Array is", duplicateUnsortedArray1)
    var firstIndex = 0
    let lastIndex = duplicateUnsortedArray1.count - 1
    while(firstIndex < lastIndex) {
        var count = 1
        if duplicateUnsortedArray1[firstIndex] != -1 {
            var firstJindex = firstIndex + 1
            while(firstJindex < lastIndex) {
                if duplicateUnsortedArray1[firstIndex] == duplicateUnsortedArray1[firstJindex] {
                    count += 1
                    duplicateUnsortedArray1[firstJindex] = -1
                }
                firstJindex += 1
            }
        }
        if count > 1 {
            print("Duplicate elements are", duplicateUnsortedArray1[firstIndex], count)
        }
        firstIndex += 1
    }
}

//duplicateUnSortedArray()

func linearSearch(element: Int) {
    print("Entered Array is", array1)
    var firstIndex = 0
    let lastIndex = duplicateSortedArray1.count - 1
    while(firstIndex < lastIndex) {
        if array1[firstIndex] == element {
            print("Element found at index", firstIndex)
            break
        }
        firstIndex += 1
    }
}

//linearSearch(element: 10)

func binarySearch(array: [Int], element: Int, low: Int, high: Int) {
    let mid = (low + high) / 2
    if low > high {
        print("Element not found")
    } else {
        if element == array[mid] {
            print("Element found at index", mid)
        } else if element > array[mid] {
            binarySearch(array: array, element: element, low: mid + 1, high: high)
        } else {
            binarySearch(array: array, element: element, low: low, high: mid - 1)
        }
    }
}

//binarySearch(array: sortedArray1, element: 20, low: 0, high: sortedArray1.count - 1)

func ternarySearch(array: [Int], element: Int, low: Int, high: Int) {
    let mid1 = low + (high - low) / 3
    let mid2 = high - (high - low) / 2
    print("element < array[mid1]", low, high, mid1, mid2)
    if high >= low {
        if element == array[mid1] {
            print("Element found at index", mid1)
        } else if element == array[mid2] {
            print("Element found at index", mid2)
        } else if element < array[mid1] {
            ternarySearch(array: array, element: element, low: low, high: mid1 - 1)
        } else if element > array[mid2] {
            ternarySearch(array: array, element: element, low: mid2 + 1, high: high)
        } else {
            ternarySearch(array: array, element: element, low: mid1 + 1, high: mid2 - 1)
        }
    } else {
        print("Element not found")
    }
}

//ternarySearch(array: [1,2,3,4,5,6,7,8,9,10], element: 6, low: 0, high: sortedArray1.count - 1)

func mergeArrayWithExtraSpace() {
    print("Entered array is", sortedArray1)
    print("Entered array is", sortedArray2)
    var i = 0
    var j = 0
    var k = 0
    let lengthOfFirstArray = sortedArray1.count
    let lengthOfSecondArray = sortedArray2.count
    var mergedArray = Array(repeating: 0, count: sortedArray1.count + sortedArray2.count)
    while(i < lengthOfFirstArray && j < lengthOfSecondArray) {
        if sortedArray1[i] < sortedArray2[j] {
            mergedArray[k] = sortedArray1[i]
            i += 1
        } else {
            mergedArray[k] = sortedArray2[j]
            j += 1
        }
        k += 1
    }
    while(i < lengthOfFirstArray) {
        mergedArray[k] = sortedArray1[i]
        k += 1
        i += 1
    }
    while(j < lengthOfSecondArray) {
        mergedArray[k] = sortedArray2[j]
        k += 1
        j += 1
    }
    print("Merged array is", mergedArray)
}

//mergeArrayWithExtraSpace()

func selectionSort() {
    print("Entered array is", array1)
    var firstIndex = 0
    let lastIndex = array1.count - 1
    while(firstIndex < lastIndex) {
        var min = firstIndex
        var firstJindex = firstIndex + 1
        while(firstJindex <= lastIndex) {
            if array1[min] > array1[firstJindex] {
                min = firstJindex
            }
            firstJindex += 1
        }
        let temp = array1[firstIndex]
        array1[firstIndex] = array1[min]
        array1[min] = temp
        firstIndex += 1
    }
    print("Selection sort array is", array1)
}

//selectionSort()

func bubbleSort() {
    print("Entered array is", array1)
    var firstIndex = 0
    let lastIndex = array1.count - 1
    while(firstIndex < lastIndex) {
        var firstJindex = 0
        while(firstJindex < lastIndex - firstIndex) {
            if array1[firstJindex] > array1[firstJindex + 1] {
                let temp = array1[firstJindex]
                array1[firstJindex] = array1[firstJindex + 1]
                array1[firstJindex + 1] = temp
            }
            firstJindex += 1
        }
        firstIndex += 1
    }
    print("Bubble sort array is", array1)
}

//bubbleSort()

func insertionSort() {
    print("Entered array is", array1)
    var firstIndex = 0
    let lastIndex = array1.count - 1
    while(firstIndex <= lastIndex) {
        let temp = array1[firstIndex]
        var jindex = firstIndex - 1
        while(jindex >= 0 && temp < array1[jindex]) {
            array1[jindex + 1] = array1[jindex]
            jindex -= 1
        }
        array1[jindex + 1] = temp
        firstIndex += 1
    }
    print("Insertion sort array is", array1)
}

//insertionSort()

func mergeSort(array: inout [Int], low: Int, high: Int) {
    if low >= high {
        return
    }
    let mid = (high + low) / 2
    mergeSort(array: &array, low: low, high: mid)
    mergeSort(array: &array, low: mid+1, high: high)
    mergeArray(array: &array, low: low, mid: mid, high: high)
}

func mergeArray(array: inout [Int], low: Int, mid: Int, high: Int) {
    let leftSubarray = Array(array[low...mid])
    let rightSubarray = Array(array[mid+1...high])
    var index = low
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
        if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
            array[index] = leftSubarray[leftIndex]
            leftIndex += 1
        }
        else {
            array[index] = rightSubarray[rightIndex]
            rightIndex += 1
        }
        index += 1
    }
    while leftIndex < leftSubarray.count {
        array[index] = leftSubarray[leftIndex]
        index += 1
        leftIndex += 1
    }
    while rightIndex < rightSubarray.count {
        array[index] = rightSubarray[rightIndex]
        index += 1
        rightIndex += 1
    }
}

//mergeSort(array: &array1, low: 0, high: array1.count-1)
//print("Merge sort array is", array1)

func quickSort(array: inout [Int], low: Int, high: Int) {
    if low >= high {
        return
    }
    let pivot = partitionArray(array: &array, low: low, high: high)
    quickSort(array: &array, low: low, high: pivot - 1)
    quickSort(array: &array, low: pivot + 1, high: high)
}

func partitionArray(array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[low]
    var index = low
    var jindex = high
    while(index < jindex) {
        while(array[index] <= pivot) {
            index += 1
        }
        while(array[jindex] > pivot) {
            jindex -= 1
        }
        if (index < jindex) {
            let temp = array[index]
            array[index] = array[jindex]
            array[jindex] = temp
        }
    }
    let temp = array[jindex]
    array[jindex] = array[low]
    array[low] = temp
    return jindex
}

//quickSort(array: &array1, low: 0, high: array1.count-1)
//print("Quick sort array is", array1)

func countSort(array: inout [Int]) {
    print("Entered array is", array)
    var firstIndex = 0
    let lastIndex = array.count - 1
    var max = array[0]
    while(firstIndex < lastIndex) {
        if max < array[firstIndex] {
            max = array[firstIndex]
        }
        firstIndex += 1
    }
    var hashedArray = Array(repeating: 0, count: max+1)
    firstIndex = 0
    while(firstIndex <= lastIndex) {
        hashedArray[array[firstIndex]] += 1
        firstIndex += 1
    }
    firstIndex = 0
    var firstJindex = 0
    array = Array(repeating: 0, count: array.count)
    while(firstIndex <= max) {
        if hashedArray[firstIndex] == 0 {
            firstIndex += 1
        } else {
            array[firstJindex] = firstIndex
            hashedArray[firstIndex] -= 1
            firstJindex += 1
        }
    }
    print("Count sort array is", array)
}

//countSort(array: &array1)

func countSort(array: inout [Int], positionToBeSort: Int) {
    var firstIndex = 0
    let lastIndex = array.count - 1
    var hashedArray = Array(repeating: 0, count: 10)
    firstIndex = 0
    while(firstIndex <= lastIndex) {
        hashedArray[(array[firstIndex] / positionToBeSort) % 10] += 1
        firstIndex += 1
    }
    firstIndex = 1
    while(firstIndex < 10) {
        hashedArray[firstIndex] += hashedArray[firstIndex - 1]
        firstIndex += 1
    }
    firstIndex = array.count - 1
    var secondArray = Array(repeating: 0, count: array.count)
    while (firstIndex >= 0) {
        let position = hashedArray[(array[firstIndex] / positionToBeSort) % 10]
        hashedArray[(array[firstIndex] / positionToBeSort) % 10] -= 1
        secondArray[position - 1] = array[firstIndex]
        firstIndex -= 1
    }
    array = secondArray
}

func radixSort(array: inout [Int]) {
    print("Entered array is", array)
    var firstIndex = 0
    let lastIndex = array.count - 1
    var max = array[0]
    while(firstIndex < lastIndex) {
        if max < array[firstIndex] {
            max = array[firstIndex]
        }
        firstIndex += 1
    }
    var position = 1
    while(max/position > 0) {
        countSort(array: &array, positionToBeSort: position)
        position *= 10
    }
}

//radixSort(array: &radixArray1)
//print("Radix sort array is", bucketArray1)

func shellSort(array: inout [Int]) {
    print("Entered array is", array)
    var gap = array.count / 2
    let lastJindex = array.count - 1
    while(gap > 0) {
        var firstJindex = gap
        while(firstJindex <= lastJindex) {
            var firstIndex = firstJindex - gap
            while(firstIndex >= 0) {
                if array[firstIndex + gap] > array[firstIndex] {
                    break
                } else {
                    let temp = array[firstIndex + gap]
                    array[firstIndex + gap] = array[firstIndex]
                    array[firstIndex] = temp
                }
                firstIndex -= gap
            }
            firstJindex += 1
        }
        gap /= 2
    }
    print("Shell sort array is", array)
}

//shellSort(array: &array1)
