class Solution {
    // Expand around each possible center, counting palindromes along the way
    // time: O(n^2)
    // space: O(1)
    func countSubstrings(_ s: String) -> Int {
        let s = Array(s)
        
        var counter = 0
         
        for i in 0 ..< s.count {
            checker(s, i, i, &counter)     // odd case - expand around single chars 
            checker(s, i, i + 1, &counter) // even case - expand around pairs of chars
        }
        
        return counter
    }
    
    private func checker(_ s: Array<Character>, 
                         _ start: Int, 
                         _ end: Int,
                         _ counter: inout Int) {
        var start = start
        var end = end
        while start >= 0 && end < s.count {
            // continue expanding until we find two chars that aren't equal
            guard s[start] == s[end] else { break }
            counter += 1
            start -= 1
            end += 1
        }
    }
}
    
    // naive
    // time complexity: O(n^3)
//     func countSubstrings(_ s: String) -> Int {
//         guard !s.isEmpty else { return 0 }
//         guard s.count > 1 else { return 1 }
        
//         let s = Array(s)
//         var palindromeCount = 0
        
//         for i in 0..<s.count {
//             for j in i..<s.count {
//                 if Array(s[i...j]).isPalindrome() {
//                     palindromeCount += 1
//                 }
//             }
//         }
//         return palindromeCount
//     }
// }

// extension Array where Element == Character {
//     func isPalindrome() -> Bool {
//         return self == Array(self.reversed())
//     }
// }