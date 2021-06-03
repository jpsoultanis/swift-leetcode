class Solution {
    
    // High level:
    // Define smallest possible capacity as largest package size.
    // Define largest possible capacity as sum of all package sizes.
    // Binary search to continue seeking optimal capacity.
    // Time: O(n log n)
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        guard !weights.isEmpty else { return 0 }
        
        var left = weights.max()! // smallest possible capacity is largest package
        var right = weights.reduce(0,+) // largest possible capacty is total size of all packages
        
        while left < right {
            let midCapacity = left + ((right - left) / 2)
            
            if canShip(weights, days, midCapacity) {
                right = midCapacity
            } else {
                left = midCapacity + 1
            }
        }
        
        return left
    }
    
    func canShip(_ weights: [Int], _ days: Int, _ capacity: Int) -> Bool {
        var curDays = 1
        var curWeight = 0
        
        for weight in weights {
            if curWeight + weight > capacity {
                curDays += 1
                curWeight = weight
                guard curDays <= days else { return false }
            } else {
                curWeight += weight
            }
        }
        
        return true
    }
}