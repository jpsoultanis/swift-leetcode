class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        var intervals = intervals.compactMap { return Interval($0) }
        
        guard !intervals.isEmpty else { return true }
        
        intervals.sort { return $0.start < $1.start }
        
        for i in 0 ..< intervals.count - 1 {
            let lhs = intervals[i]
            let rhs = intervals[i+1]
            
            guard !lhs.overlaps(rhs) else { return false }
        }
        
        return true
    }
}

struct Interval {
    let start: Int
    let end: Int
    
    init?(_ arr: [Int]) {
        guard arr.count == 2 else { return nil }
        start = arr[0]
        end = arr[1]
    }
    
    func overlaps(_ interval: Interval) -> Bool {
        if self.start <= interval.start { // overlap
            return self.end > interval.start
        } else if interval.start <= self.start { // overlap
            return interval.end > self.start
        } else if self.start >= interval.start {
            return self.end <= interval.end   // contains
        } else if interval.start >= self.start {
            return interval.end <= self.end  //contains
        }
        
        return false
    }
}