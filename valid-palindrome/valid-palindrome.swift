class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let alphaNumeric = s.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
        return (alphaNumeric == String(alphaNumeric.reversed()))
    }
}
