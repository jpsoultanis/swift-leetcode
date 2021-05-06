class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        let numElements = nums.count
        
        var maxLength = 1
        var lastIncrementNum = Int.min
        var dp = [1] + Array(repeating: 0, count: numElements - 1)
        
        for i in 1..<numElements {
            var length = 0
            for j in 0..<i {
                if nums[i] > nums[j] {
                    length = max(length, dp[j])
                }
                dp[i] = length + 1
                maxLength = max(maxLength, dp[i])
            }
        }
        
        return maxLength
    }
}