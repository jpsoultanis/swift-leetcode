class Solution {
    /// Iterate from bottom to top row of the triangle, storing the shortest path possible
    /// to reach each node as we go.
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var mutableTriangle = triangle
        guard let lastRow = mutableTriangle.popLast() else { return 0 }
        
        // create array of running totals, starting with bottom of triangle        
        var totals = lastRow
​
        // iterate from bottom row we haven't seen yet to top row
        for row in mutableTriangle.reversed() {
            
            for (i, val) in row.enumerated() {
                guard i < row.count else { continue }
​
                // for each element in row, calc the minimum accessible path
                // and update running totals
                totals[i] = val + min(totals[i], totals[i+1])
            }
        }
        
        // since the last row is the root with only one item, the smallest path we've
        // dynamically calculated will always be the first item in our list of running totals
        return totals[0]
    }
}
