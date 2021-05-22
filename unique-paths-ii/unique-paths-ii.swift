class Solution {
    
    // Use a dynamic programming array to build the number of paths available to reach each square.
    // We first setup the left and top perimeter with 0 / 1 depending on obstacle presense and then
    // use the perimeter as a baseline to calculate the number of paths through the center.
    //
    // As long as we aren't on an obstacle, the general formula:
    //    dp[i][j] = dp[i-1][j] + dp[i][j-1] 
    //
    // The answer should be the last number in the last array.
    //
    // Example: 
    //      (X represents an obstacle and should be treated as 0 in the dp array)
    //
    //      [1, 1, 1, X, 0]
    //      [X, 1, 2, 2, 2]
    //      [0, 2, X, 2, 4]
    //      [0, 2, 2, 4, 8]
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var dp = setupDpPerimeter(obstacleGrid)
        
        // fill in squares through the dp array
        for i in 1..<dp.count {
            for j in 1..<dp[0].count {
                let hasObstacle = (obstacleGrid[i][j] == 1)
                
                if hasObstacle {
                    dp[i][j] = 0 // no paths to reach a square with an obstacle
                } else {
                    // use previous computed results to fill in next square
                    dp[i][j] = dp[i-1][j] + dp[i][j-1] 
                }
            }
        }
        
        return dp.last?.last ?? 0
    }
    
    // Create a dp array of arrays with the top and left perimeter containing the
    // number of paths possible to reach each square, accounting for obstacles.
    // This will be used to compute the number of paths possible through the center.
    //
    // Ex:    obstacleGrid:
    //        [0, 0, 0, X]
    //        [X, 0, 0, 0]
    //        [0, 0, 0, 0]
    //
    //         dp returned:
    //        [1, 1, 1, 0]
    //        [0, 0, 0, 0]
    //        [0, 0, 0, 0]
    private func setupDpPerimeter(_ obstacleGrid: [[Int]]) -> [[Int]] {   
        let xCount = obstacleGrid[0].count
        let yCount = obstacleGrid.count
        
        var dp = Array(repeating: Array(repeating: 0, count: xCount), count: yCount)
        
        for i in 0..<xCount {
            // if we hit an obstacle on the border, stop
            // the rest of the row will remain at 0
            guard obstacleGrid[0][i] == 0 else { break }
            dp[0][i] = 1
        }
        
        for j in 0..<yCount {
            // if we hit an obstacle on the border, stop
            // the rest of the row will remain at 0
            guard obstacleGrid[j][0] == 0 else { break }
            dp[j][0] = 1
        }
        
        return dp
    }
}