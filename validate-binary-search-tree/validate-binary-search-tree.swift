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
    
    private var prev: TreeNode?
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return inOrder(root)
    }
    
    func inOrder(_ node: TreeNode?) -> Bool {
        guard let node = node else { return true } 
                
        let isValidLeft = inOrder(node.left)

        if let prev = prev, node.val <= prev.val {
            return false
        }
        
        prev = node

        let isValidRight = inOrder(node.right)
        
        return isValidLeft && isValidRight
    }
}