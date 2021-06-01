class Solution {
    /*
        This problem could be easily done in O(n) time and O(n) space using a dictionary.
        However, this doesn't leverage the fact that the data is sorted. By taking advantage
        of this attribute, we can reduce our solution to O(1) space.
    
        Use two pointers at either end of the numbers array. Increment left if sum is 
        smaller than target. Decrement right if sum is larger than target.
        Time: O(n), Space O(1)
    */
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard !numbers.isEmpty else { return [] }
        
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            
            if sum > target {
                right -= 1
            } else if sum < target {
                left += 1
            } else {
                return [left + 1, right + 1]
            }
        }
        
        return []
    }
}