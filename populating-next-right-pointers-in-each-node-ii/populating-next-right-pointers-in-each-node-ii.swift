class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        
        // set up queue for BFS
        var queue = [Node]()
        queue.append(root)
        
        // iterate until all nodes are processed
        while !queue.isEmpty {
            
            let levelSize = queue.count
​
            // handle each level at a time to make sure the last node in every level is nil
            for i in 0..<levelSize {
​
                // should always succeed since we just confirmed the queue isn't empty
                let curNode = queue.removeLast()
                
                // if this isn't the last node and there's a valid item to the right...
                if i < (levelSize - 1), let nextNode = queue.last {
                    curNode.next = nextNode
                }
                
                // add children to queue to continue BFS 
                if let left = curNode.left {
                    queue.insert(left, at: 0)
                }
                
                if let right = curNode.right {
