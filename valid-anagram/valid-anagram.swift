class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return getCharCount(of: s) == getCharCount(of: t)
    }
    
    private func getCharCount(of s: String) -> [Character: Int] {
        var charCount = [Character: Int]()
        for char in s {
            charCount[char, default: 0] += 1
        }
        return charCount
    }
}