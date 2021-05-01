class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        
        var total = 1
        var numZeros = 0
        
        for num in nums {
            if num == 0 {
                numZeros += 1
            } else {
                total *= num
            }
        }
        
        return nums.map { num -> Int in
            if numZeros == 0 {
                return total / num
            } else if numZeros == 1 && num == 0 {
                return total
            } else {
                return 0
            }
        }
    }
}