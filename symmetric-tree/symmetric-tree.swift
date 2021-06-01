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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        var queue: [TreeNode?] = [root]
        
        // BFS
        while !queue.isEmpty {
            let levelCount = queue.count
            var levelNodes = [TreeNode?]() // collect all nodes in a given level
            
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                levelNodes.append(node)
                
                if let node = node {
                    queue.append(node.left)
                    queue.append(node.right)
                }
            }
            
            guard levelCount >= 2 else { continue }
            
            // compare the left and right halves of the array built for this level
            let halfIndex = (levelCount / 2)
            let lhs = levelNodes[0..<halfIndex]
            let rhs = levelNodes[halfIndex...].reversed()
                        
            guard Array(lhs) == Array(rhs) else { return false }
        }
        
        return true
    }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
}