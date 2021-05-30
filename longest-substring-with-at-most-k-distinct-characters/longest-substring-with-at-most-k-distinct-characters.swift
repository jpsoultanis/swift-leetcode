class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        guard !s.isEmpty, k > 0 else { return 0 }
        
        let s = Array(s)
        
        var charMap = [Character: Int]()
        
        var left = 0
        var right = 0
        
        var maxLength = 1
        
        while right < s.count {
            let char = s[right]
            
            // found distinct character
            if charMap[char] == nil {
                // if we have space for more distinct characters
                if charMap.keys.count < k {
                    charMap[char] = 1
                    maxLength = max(maxLength, right - left + 1)
                    right += 1
                } else {
                    // No more room for disinct characters
                    // Move left side of sliding window up and delete characters until
                    // We've removed all instances of a distinct character.
                    while charMap.keys.count == k {
                        let charToRemove = s[left]
                        guard let charCount = charMap[charToRemove] else { break }
                        if charCount == 1 {
                            charMap[charToRemove] = nil
                        } else {
                            charMap[charToRemove] = charCount - 1
                        }     
                        
                        left += 1
                    }
                }
            } else {
                // found duplicate char, expand sliding window
                maxLength = max(maxLength, right - left + 1)
                right += 1
                charMap[char, default: 0] += 1
            }
        }
        
        return maxLength
    }
}