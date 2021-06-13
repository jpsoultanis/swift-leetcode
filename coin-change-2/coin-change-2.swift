class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else { return 1 }
        var dp = [1] + Array(repeating: 0, count: amount)
        
        for coin in coins {
            guard coin <= amount else { continue }
            for i in coin...amount {
                dp[i] += dp[i - coin]
            }
        }
                
        return dp.last ?? 0
    }
}