class Solution {
    
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var memo = [Int: Int]()
        
        return getCombinations(nums, target, &memo)
    }
    
    private func getCombinations(_ nums: [Int],
                                 _ remaining: Int, 
                                 _ memo: inout [Int: Int]) -> Int {
        // base-case. 
        // When we've found the target number, return 1 representing the discovery of a valid combination
        guard remaining != 0 else { return 1 }
        
        // if we've already computed the number of combinations
        // for the remaining value, use memoization to save recursive calls
        if let numCombinations = memo[remaining] {
            return numCombinations
        }
        
        var numCombinations = 0
        
        for num in nums {
            // recursively compute the number of combinations
            if (remaining - num) >= 0 {
                numCombinations += getCombinations(nums, remaining - num, &memo)
            }
        }
        // add the result to our memoization dict
        memo[remaining] = numCombinations
        
        return numCombinations
    }
}