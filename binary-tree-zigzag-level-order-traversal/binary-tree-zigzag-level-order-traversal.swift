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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var queue: [TreeNode] = [root]
        var results = [[Int]]()
        var level = 0
        
        while !queue.isEmpty {
            let levelCount = queue.count
            var levelNodes = [Int]()
            
            for _ in 1...levelCount {
                let node = queue.removeFirst()
                levelNodes.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            // even levels maintain same order as in source tree
            if level % 2 == 0 {
                results.append(levelNodes)
            } else {
                results.append(levelNodes.reversed()) // odd levels needs to be flipped
            }
            
            level += 1
        }
        
        return results
    }
}