class Solution {
    // Explanation of solution:
    //
    // Any even number will have the same number of bits as that number divided by 2.
    // This is because dividing by 2 is esssentially a right shift, and we have a 0 in the one's place.
    //
    // Any odd number will have N + 1 bits where N is the number of bits for that number divided by 2, floor.
    // That is because when we divide by 2, the right shift causes us to lose the bit in the one's place.
    // Ex: 5 -> 101, 5/2 = 2, 
    //     2 ->  10
    //
    // Knowing these rules, use Dynamic Programming to build an array where
    // we can use the number of bits for each old int to compute number of bits for our new int.
    func countBits(_ n: Int) -> [Int] {
        guard n > 0 else { return [0] }
        
        // dp array
        var numBits = Array(repeating: 0, count: n + 1)
        
        for num in 1...n {
            if num.isOdd {
                numBits[num] = numBits[num/2] + 1
            } else {
                numBits[num] = numBits[num/2]
            }
        }
        
        return numBits
    }
}

extension Int {
    var isOdd: Bool {
        return self % 2 != 0
    }
}