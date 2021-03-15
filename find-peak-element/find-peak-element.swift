class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        let lastIndex = nums.count - 1
                
        for curIndex in (0..<lastIndex) {
            // if we find a value lower than the current one, we found a peak
            guard nums[curIndex + 1] > nums[curIndex] else { return curIndex }
        }
        
        // if we get to here, the values in nums have been steadily increasing.
        // this makes the last value of nums of peak
        return lastIndex
    }
}