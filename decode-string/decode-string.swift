class Solution {
    func decodeString(_ s: String) -> String {
        var stack = [(String, Int)]() // findings so far & discovered k Int
        var result = "" 
        var k = 0

        for char in s {
            switch char {
            case "[":
                stack.append((result, k))
                result = ""
                k = 0
            case "]":
                let (prev, k) = stack.removeLast() 
                result = prev + String(repeating: result, count: k)
            case _ where char.isNumber:
                k *= 10 
                k += Int(String(char))!
            default: 
                result += String(char)
            }
        }

        return result
    }
}