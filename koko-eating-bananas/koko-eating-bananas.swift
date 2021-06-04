class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard !piles.isEmpty else { return 0 }

        var left = 1 // min possible banana eating rate
        var right = piles.max()! // max necessary banana eating rate
        
        // binary search to find min eating rate
        while left < right {
            let midEatingRate = left + ((right - left) / 2)
            
            if canEatAllBananas(piles, h, midEatingRate) {
                right = midEatingRate
            } else {
                left = midEatingRate + 1
            }
        }
        return right
    }
    
    // Compute if Koko can eat all bananas in a given period of time at a specific rate of eating
    func canEatAllBananas(_ piles: [Int], _ hours: Int, _ numPerHour: Int) -> Bool {
        var hoursLeft = hours
        
        for pile in piles {
            if numPerHour >= pile {
                hoursLeft -= 1  // if we're fast enoguh to consume pile in 1 hour...
            } else {
                // num hours required to eat the pile, rounded up
                let duration = ceil(Double(pile) / Double(numPerHour)) 
                hoursLeft -= Int(duration)
            }
            
            guard hoursLeft >= 0 else { return false }
        }
        
        return true
    }
}