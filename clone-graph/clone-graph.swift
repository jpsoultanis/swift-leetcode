/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var visited = [Node: Node]()
        
        return cloneGraphRecursive(node, &visited)
    }
    
    func cloneGraphRecursive(_ node: Node?, _ visited: inout [Node: Node]) -> Node? {
        guard let node = node else { return nil }
        
        // if we've seen this node before, return the clone
        // from visited dict to prevent infinite recursion loop
        if let clonedNode = visited[node] {
            return clonedNode
        }
        
        // copy the node, update our visited dict
        let nodeCopy = Node(node.val)
        visited[node] = nodeCopy
        
        // copy all neighbors recursively
        for neighbor in node.neighbors {
            nodeCopy.neighbors.append(cloneGraphRecursive(neighbor, &visited))
        }
        
        return nodeCopy
    }
}