/**
 Two Sum Problem : Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 Input: nums = [2,7,11,15, 5, 3], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 
 Brute Force - Take each number and loop through the array to get other number which adds up to target number, its bad approach as it will be O(n2)
 
 Better Approach  -
 
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    
    for (index, number) in nums.enumerated() {
        dict[number] = index
    }
    print(dict)
    for (index,num) in nums.enumerated() {
        if let otherIndex = dict[target - num], otherIndex != index {
            return [index, otherIndex]
        }
    }
    return [0,0]
}
let nums = [3,2,4]
twoSum(nums, 6)

/**
 
 Fibonacci - 1 1 2 3 5 8 13
 */

func fib(num: Int) -> Int {
    if num < 2 {
        return num
    }
    var first = 1
    var second = 1
    var val = 0
    for _ in 2...num {
        val = first + second
        first = second
        second = val
    }
    return val
}


fib(num: 5)

/**
 Binary search in sorted array : search a value in a sorted array using binary search tree
 */

var arr = [2,3,4,6,5,7,8,9]
func binarySearch(array: [Int], searchVal: Int) -> Bool{
    if array.count <= 0 {
        return false
    }
    var firstIndex = 0
    var lastIndex = array.count - 1
    
    while firstIndex <= lastIndex {
        let mid = (firstIndex + lastIndex)/2
        
        if array[mid] == searchVal {
            return true
        }else if searchVal < array[mid] {
            lastIndex = mid - 1
        } else {
            firstIndex = mid + 1
        }
    }
    return false
    
}
binarySearch(array: arr, searchVal: 0)

/**
 Find second max element in an array of int
 */

let array = [4,5,6,3,6,8,3,1]  // Find second max


func findSecondMax() -> Int {
    var first = 0, second = 0
    for item in array {
        if item > first {
            second = first
            first = item
        }
    }
    return second
}

findSecondMax()


/*
 second larget digit in string
 
 Example 1:

 Input: s = "dfa12321afd"
 Output: 2
 Explanation: The digits that appear in s are [1, 2, 3]. The second largest digit is 2.
 */

func findSecondMaxInString(str:String) -> Int {
    var digitArray = [Int]()
    for char in str {
        if char.isNumber {
            if let number = Int(String(char)) {
                digitArray.append(number)
            }
        }
    }
    
    var first = 0, second = 0
    
    for item in digitArray {
        if item > first {
            second = first
            first = item
        }
    }
    return second
}
findSecondMaxInString(str: "dfa12321afd")


/*
 Sorting Algo : Quick Sort
 */
func quickSort(arr:[Int]) -> [Int]{
    var less = [Int]()
    var greater = [Int]()
    var equel = [Int]()
    if arr.count > 1 {
        let pivot = arr[arr.count/2]
        for x in  arr{
            if x > pivot {
                greater.append(x)
            } else if x < pivot {
                less.append(x)
            } else {
                equel.append(x)
            }
        }
        return quickSort(arr: less) + equel + quickSort(arr: greater)
    }
    return arr
}
quickSort(arr: array)


/**
 Find kth largest in an array
 */

func findKthLargest(arr: [Int], k: Int)  -> Int {
    let sortedArr = quickSort(arr: arr)
    return sortedArr[k]
}


/**
 Group Anagram : Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 */

func groupAnagram(arr: [String]) -> [[String]]{
    var dict = [String : [String]]()
    for item in arr {
        let value = item
        let key = String(item.sorted())
        if let _ = dict[key] {
            dict[key]?.append(value)
        } else {
            dict[key] = [value]
        }
        
    }
    return Array(dict.values)
}
groupAnagram(arr: ["eat","tea","tan","ate","nat","bat"])

