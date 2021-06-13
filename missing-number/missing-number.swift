class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let expectedTotal = nums.count * (nums.count + 1) / 2
        let total = nums.reduce(0, +)
        return expectedTotal - total
    }
}