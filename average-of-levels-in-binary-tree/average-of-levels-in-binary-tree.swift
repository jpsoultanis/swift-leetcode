/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        
        var queue: [TreeNode] = [root]
        var averages = [Double]()
        
        // BFS queue
        while !queue.isEmpty {
            var currentTotal: Double = 0
            let numNodes = queue.count
            
            // for each while loop iteration, step through the level
            // and generate the average
            for i in 0..<numNodes {
                let node = queue.removeFirst()
                currentTotal += Double(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            averages.append(currentTotal / Double(numNodes))
        }
        
        return averages
    }
}