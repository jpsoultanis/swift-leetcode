class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var left = 0
        var right = s.count - 1
                
        while left < right {
            if s[left] == s[right] {
                left += 1
                right -= 1
            } else {
                // found a mismatch, try to skip the left or right char
                let canDeleteLeft = Array(s[left+1...right]).isPalindrome()
                let canDeleteRight = Array(s[left..<right]).isPalindrome()
                return canDeleteLeft || canDeleteRight
            }
        }
        
        // if we get to here, the pointers have crossed meaning we can build a valid palindrone
        return true
    }
}

extension Array where Element == Character {
    func isPalindrome() -> Bool {
        return self == self.reversed()
    }
}
