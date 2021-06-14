class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        
        var longestSize = 0
        for num in nums {
            if !numSet.contains(num - 1) {
                var currentNum = num
                var currentSize = 1
                
                while numSet.contains(currentNum + 1) {
                    currentSize += 1
                    currentNum += 1
                }
                
                longestSize = max(currentSize, longestSize)
            }
        }
        
        return longestSize
    }
}