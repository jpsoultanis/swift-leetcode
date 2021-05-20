class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = Array(a)
        var b = Array(b)
        
        let countDiff = a.count - b.count
        if countDiff > 0 {
            b = Array(repeating: "0", count: countDiff) + b
        } else {
            a = Array(repeating: "0", count: abs(countDiff)) + a
        }
        
        // a and b are now the same size. loop through the strings and add together
        
        var carryBit = 0
        var result = ""
        
        // iterate from right to left though our binary strings
        for i in (0..<(a.count)).reversed() {
            guard let bitA = Int(String(a[i])) else { continue }
            guard let bitB = Int(String(b[i])) else { continue }

            let bit = carryBit + bitA + bitB // add each bit plus the carry bit
            
            result = String(bit % 2) + result // append resulting bit to front
            
            carryBit = (bit >= 2) ? 1 : 0 // update carryBit for next column of digits
        }
        
        // after our loop terminates, if there's a value left in our carry bit we need to remember
        // to add it to the left side of our result
        // ex: "10" + "10" = "100"
        if carryBit == 1 {
            result = "1" + result
        }
        
        return result
    }
}