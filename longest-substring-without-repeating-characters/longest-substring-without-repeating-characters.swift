class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var substringSet = Set<Character>()
        var start = 0
        var end = 0
        var length = 0
        
        let s = Array(s)
                
        while end < s.count {
            if substringSet.contains(s[end]) {
                substringSet.remove(s[start])
                start += 1
            } else {
                substringSet.insert(s[end])
                end += 1
                
                length = max(length, substringSet.count)
            }
        }
        
        return length
    }
}