class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Character]()
        var firstPass = ""
        var result = ""
        
        let s = Array(s)
    
        for char in s {
            if char == "(" {
                stack.append(char)
                firstPass += String(char)
            } else if char == ")" {
                if let top = stack.last, top == "(" {
                    _ = stack.popLast()
                    firstPass += String(char)
                }
            } else {
                firstPass += String(char)
            }
        }

        stack = []
        
        for char in firstPass.reversed() {
            if char == ")" {
                stack.append(char)
                result += String(char)
            } else if char == "(" {
                if let top = stack.last, top == ")" {
                    _ = stack.popLast()
                    result += String(char)
                }
            } else {
                result += String(char)
            }
        }
        
        return String(result.reversed())
        
    }
}