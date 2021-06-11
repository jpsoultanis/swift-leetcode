class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard !coins.isEmpty, amount >= 0 else { return -1 }
        guard amount != 0 else { return 0 }
        
        var dp = [0] + Array(repeating: amount + 1, count: amount)
        
        // Compute min number of coins for each cent value up to the total amount.
        // Reuse previous results to compute N amount.
        for total in 1...amount {
            for coin in coins {
                guard coin <= total else { continue }
                dp[total] = min(dp[total], 1 + dp[total - coin])
            }
        }
                
        return dp[amount] > amount ? -1 : dp[amount]
    }
}