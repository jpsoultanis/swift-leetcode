class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        for i in 1..<m {
            for j in 1..<n {
                // compute the next square based on the number of total
                // paths it takes to have gotten to either of the two possible
                // adjacent squares.
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        
        // return the very last item of the very last array
        // which now contains the total number of unique paths
        return dp.last?.last ?? 0
    }
    
    /* Slow recursive solution
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if (m == 1) || (n == 1) {
            return 1
        }
        
        return uniquePaths(m - 1, n) + uniquePaths(m, n - 1)
    }
    */
}