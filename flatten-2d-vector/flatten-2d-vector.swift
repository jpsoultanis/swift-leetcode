
class Vector2D {
    
    var outerIndex = 0
    var innerIndex = 0
    let data: [[Int]]

    init(_ vec: [[Int]]) {
        data = vec
    }
    
    func next() -> Int {
        var innerArray = [Int]()
        var tmpValue: Int?
        
        // iterate until we find the next valid item, or until
        // we go out of range
        while tmpValue == nil {
            innerArray = data[outerIndex]
            
            guard innerIndex < innerArray.count else {
                iterate(innerArray)
                continue
            }
            
            tmpValue = innerArray[innerIndex]
        }
        
        // found the next number, iterate one more time and return the value found
        iterate(innerArray)
        
        // can't be nil due to while loop above
        return tmpValue!
    }
    
    func hasNext() -> Bool {        
        var innerArray = [Int]()
        var tmpValue: Int?
        
        // iterate until we find the next valid item, or until
        // we go out of range
        while tmpValue == nil {
            guard outerIndex < data.count else { return false }
            
            innerArray = data[outerIndex]
            
            guard innerIndex < innerArray.count else {
                iterate(innerArray)
                continue
            }
            
            tmpValue = innerArray[innerIndex]
        }
        
        return true
    }
    
    private func iterate(_ innerArray: [Int]) {
        // if we're at the end of an array, increment the outer pointer and reset the inner
        if innerIndex >= (innerArray.count - 1) {
            outerIndex += 1
            innerIndex = 0
        } else {
            innerIndex += 1
        }
    }
}

/**
 * Your Vector2D object will be instantiated and called as such:
 * let obj = Vector2D(vec)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */