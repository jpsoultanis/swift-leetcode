class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        guard !tops.isEmpty && !bottoms.isEmpty else { return 0 }
        
        // Determine the common element between all dominos using set intersection
        var commonElementSet: Set<Int> = [tops[0], bottoms[0]]
        for i in 1 ..< tops.count {
            let dominoElements: Set<Int> = [tops[i], bottoms[i]]
            commonElementSet = commonElementSet.intersection(dominoElements)
        }
        
        // if the set is empty, there is no common domino value
        guard let commonElement = commonElementSet.first else { return -1 }
        
        // determine min # of moves
        var numMovesTop = 0
        var numMovesBottom = 0
        for i in 0..<tops.count {
            if tops[i] != commonElement {
                numMovesTop += 1
            }
            if bottoms[i] != commonElement {
                numMovesBottom += 1
            }
        }
        
        return min(numMovesTop, numMovesBottom)
    }
}