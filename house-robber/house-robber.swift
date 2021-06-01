class Solution {
    func rob(_ nums: [Int]) -> Int {        
        guard !nums.isEmpty else { return 0 }
        
        var dp = Array(repeating: 0, count: nums.count + 1)
        dp[0] = 0
        dp[1] = nums[0]
        
        for i in 2..<dp.count {
            dp[i] = max(dp[i-1], dp[i-2] + nums[i-1])
        }
        
        return dp.last ?? 0
    }
}