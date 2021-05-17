class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        
        var result = 0
        var grid = grid
        
        // scan the grid until we find land
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    // as soon as we find a "1", increment the island counter
                    // and then use a dfs to zero-out the island
                    result += 1
                    dfs(&grid, i, j)
                }
            }
        }
        
        return result
    }
    
    func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0, j >= 0, i < grid.count, j < grid[i].count, grid[i][j] == "1" else { return }
        
        grid[i][j] = "0"
        
        dfs(&grid, i - 1, j)
        dfs(&grid, i + 1, j)
        dfs(&grid, i, j - 1)
        dfs(&grid, i, j + 1)
    }
}