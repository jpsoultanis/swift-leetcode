class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var currentSum = nums[0]
        var maxSum = nums[0]
        
        // Kadane's algorithm
        for num in nums[1...] {
            currentSum = max(num, currentSum + num)
            maxSum = max(currentSum, maxSum)
        }
        
        return maxSum
    }
}