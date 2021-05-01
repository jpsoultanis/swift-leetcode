class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numSet = Set<Int>()
        
        for num in nums {
            guard !numSet.contains(num) else { return true }
            
            numSet.insert(num)
        }
        
        return false
    }
}