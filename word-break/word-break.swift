class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        // use Set for O(1) lookup
        let dict = Set<String>(wordDict)
        let s = Array(s)
        
        // var "dp" keeps track of substrings we've found in the dict.

        // "true" indicates that up until the index where it is located, some combination of substrings
        // from 0 to that index are found in the dictionary.
        // Index 0 is "true" for empty string.
        var dp = [true] + Array(repeating: false, count: s.count)
        
        for i in 0...s.count {
            for j in 0..<i {
                // if we can successfuly break up "s" until index j and we've found another substring from j to i, mark i's position as true.
                if dp[j] && dict.contains(String(s[j..<i])) {
                    dp[i] = true
                    break
                }
            }
        }
        
        // if the last item is true, then we can succcessfully
        // break up the string into substrings from the dict
        return dp.last ?? false
    }
}