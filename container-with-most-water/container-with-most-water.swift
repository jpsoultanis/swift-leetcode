class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var left = 0
        var right = height.count - 1
        
        // time: O(n)
        while left < right {
            let containerHeight = min(height[left], height[right])
            let area = (right - left) * containerHeight
            maxArea = max(maxArea, area)
            
            // move the shorter of the two container boundaries in towards the center
            // to try and discover a taller one, maximizing the area
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}