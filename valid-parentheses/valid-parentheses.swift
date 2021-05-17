class Solution {
    let charMap: [Character: Character] = [")" : "(", 
                                           "}" : "{", 
                                           "]" : "["]
    
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }

        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                guard !stack.isEmpty else { return false }
                let openParen = stack.removeLast()
                guard openParen == charMap[char] else { return false }
            }
        }
        
        return stack.isEmpty
    }
}