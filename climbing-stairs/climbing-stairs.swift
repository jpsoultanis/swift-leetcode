class Solution {
    var memo = [Int: Int]()
    
    // recursion with memoization
    func climbStairs(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        
        if n < 0 {
            return 0
        }
        
        if let numWays = memo[n] {
            return numWays
        }
        
        let numWays = climbStairs(n - 1) + climbStairs(n - 2)
        memo[n] = numWays
        
        return numWays
    }
    
    /* dynamic programming
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 } // edge-case
        
        // setup
        var dp: [Int] = [0, 1, 2]
        
        for i in 3...n {
            // dynamically compute next value of n using previous two n's distinct ways
            dp[i] = dp[i - 2] + dp[i - 1] 
        }
        
        return dp[n]
    }
    */
}