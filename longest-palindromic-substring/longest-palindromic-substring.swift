class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else { return "" }
        
        var start = 0
        var maxLength = 0
        
        let arr = Array(s)

        // for all positions of our input string, expand pointers outward to find the 
        // longest palindromic substring
        for i in 0..<s.count {
            
            // longest palindrome could be even or odd, which changes the center position we expand around
            let oddLength = arr.expandAround(left: i, right: i)
            let evenLength = arr.expandAround(left: i, right: i + 1)

            let length = max(oddLength, evenLength)
            
            if length > maxLength {
                // we've found a new longest substring
                // store the start index and the length of the new string
                start = i - ((length - 1) / 2)
                maxLength = length
            }
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: maxLength + start - 1)
        return String(s[startIndex...endIndex])
    }
    
}

extension Array where Element == Character {
    // generate the longest palindrome by expanding outward from
    // the middle of a string, represented by left and right pointers.
    func expandAround(left: Int, right: Int) -> Int {
        let length = self.count
        guard length >= 2, left <= right else { return length }
        
        var left = left
        var right = right
                
        while left >= 0, right < length, self[left] == self[right] {
            left -= 1
            right += 1
        }
        
        // undo last step where we found an invalid palindrome or went out of range
        left += 1
        right -= 1
        
        // return the length of the resulting substring
        return right - left + 1
    }
}