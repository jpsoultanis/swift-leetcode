class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagramDict = [[Character: Int] : [String]]()
        
        for str in strs {
            var letterCountDict = [Character: Int]()
            for char in str {
                letterCountDict[char, default: 0] += 1
            }
            anagramDict[letterCountDict, default: []].append(str)
        }
        
        var results = [[String]]()
        for group in anagramDict.values {
            results.append(group)
        }
        return results
    }
}