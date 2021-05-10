class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        combinationSumRecursive(candidates, target, [], 0, &result)
        
        return result
    }
    
    func combinationSumRecursive(_ candidates: [Int], 
                                 _ remain: Int, 
                                 _ current: [Int],
                                 _ start: Int,
                                 _ result: inout [[Int]]) {
        guard remain != 0 else { 
            result.append(current)
            return
        }
        
        for i in start..<candidates.count {
            let num = candidates[i]
            if num <= remain {
                combinationSumRecursive(candidates, remain - num, current + [num], i, &result)
            }
        }
    }
}