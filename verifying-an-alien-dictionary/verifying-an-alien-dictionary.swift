class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        // Quick lookup to compare char ordering
        // ex: {a: 0, b: 1, c: 2}
        let charOrderMap: [Character: Int] = buildCharOrderMap(from: order) 
        
        // Compare two words at a time. lhs should precede rhs.
        for i in 0..<(words.count - 1) {
            guard words[i].precedes(words[i+1], usingOrder: charOrderMap) else { return false }
        }
        
        // all words are in valid order
        return true
    }
    
    private func buildCharOrderMap(from order: String) -> [Character: Int] {
        var charOrderMap = [Character: Int]()
        
        for (index, char) in order.enumerated() {
            charOrderMap[char] = index
        }
        
        return charOrderMap
    }
    
}

extension String {
    func precedes(_ word: String, usingOrder order: [Character: Int]) -> Bool {
        let lhs = Array(self)
        let rhs = Array(word)
        
        // iterate until we find one letter difference or we reach the end of a word
        var i = 0
        while i < lhs.count && i < rhs.count {
            guard lhs[i] == rhs[i] else { break }
            i += 1
        }
        
        // if we reached the end of the lhs, it must precede rhs
        // if we hit the end of rhs first, order is invalid.
        // ex: "app" precedes "apple"
        guard i != lhs.count else { return true }
        guard i != rhs.count else { return false }
        
        // should never return here
        guard let lhsOrderIndex = order[lhs[i]] else { return false }
        guard let rhsOrderIndex = order[rhs[i]] else { return false }
        
        return lhsOrderIndex < rhsOrderIndex
    }
}