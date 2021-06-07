
class MinStack {
    
    private var minStack = [Int]()
    private var valStack = [Int]()

    /** initialize your data structure here. */
    init() {
    }
    
    func push(_ val: Int) {
        valStack.append(val)
        
        if let min = minStack.last {
            if val <= min { minStack.append(val) }
        } else {
            minStack.append(val)
        }
    }
    
    func pop() {
        guard !valStack.isEmpty else { return }

        let poppedVal = valStack.removeLast()
        if minStack.last == poppedVal {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        return valStack.last!
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */