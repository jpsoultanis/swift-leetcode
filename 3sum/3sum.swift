class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        
        var results = [[Int]]()
        let nums = nums.sorted()
                
        for i in 0..<nums.count {
            if (i > 0) && (nums[i] == nums[i-1]) { continue } // don't let i point to same element
            
            let target = 0 - nums[i]
            
            var left = i + 1
            var right = nums.count - 1
            
            while left < right {
                let sum = nums[left] + nums[right]
                if sum < target {
                    left += 1
                } else if sum > target {
                    right -= 1
                } else {
                    results.append([nums[i], nums[left], nums[right]])
                    left += 1
                    
                    // don't let left point to same element
                    while left < right, nums[left] == nums[left - 1] {
                        left += 1
                    }
                }
            }
        }
        return results
    }
}