/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        
        var curNode: TreeNode? = root
        
        while curNode != nil {
            guard let curVal = curNode?.val else { break }
            // This is a BST, so if the nodes we are looking for are both bigger
            // than current we look to the right
            if p.val > curVal && q.val > curVal {
                curNode = curNode?.right
            } else if p.val < curVal && q.val < curVal {
                curNode = curNode?.left // similar, but search left
            } else {
                // Found the "split point" or one of the nodes is equal to the curNode
                return curNode
            }
        }
        return nil
    }
}