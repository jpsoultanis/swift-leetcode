struct Interval {
    let left: Int
    let right: Int

    init(left: Int, right: Int) {
        self.left = left
        self.right = right
    }

    init?(_ range: [Int]) {
        guard range.count == 2 else { return nil }
        left = range[0]
        right = range[1]
    }

    func doesIntersect(_ interval: Interval) -> Bool {
        if self.left <= interval.left {
            return self.right >= interval.left
        }

        if interval.left <= self.left {
            return interval.right >= self.left
        }

        return false
    }

    // Assumes the two intervals intersect. Check `doesIntersect(:)
    // before calling this function.`
    func combine(with interval: Interval) -> Interval {
        return Interval(left: min(self.left, interval.left), 
                        right: max(self.right, interval.right))
    }
}

class Solution {
    func merge(_ ranges: [[Int]]) -> [[Int]] {
        // create array of sorted interval types
        var intervals = ranges
            .compactMap { return Interval($0) }
            .sorted { $0.left < $1.left }
        
        // setup
        guard let firstInterval = intervals.first else { return ranges }
        var result = [firstInterval]
        
        // iterate
        for i in 0..<intervals.count {
            guard let lastInterval = result.last else { return ranges }
            
            // replace intersecting intervals
            if intervals[i].doesIntersect(lastInterval) {
                result.removeLast()
                result.append(intervals[i].combine(with: lastInterval))
            } else {
                // append non-intersecting
                result.append(intervals[i])
            }
        }
        
        // transform Interval types into expected return format
        return result.map { [$0.left, $0.right] }
    }
}