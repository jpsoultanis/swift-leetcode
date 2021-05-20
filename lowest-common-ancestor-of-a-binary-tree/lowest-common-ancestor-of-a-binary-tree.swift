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
        guard let p = p, let q = q else { return nil }
        
        var ancestor: TreeNode? = nil
        lowestCommonAncestorRecursive(root, p, q, &ancestor)
        
        return ancestor
    }
    
    func lowestCommonAncestorRecursive(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode, _ ancestor: inout TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        let foundLeft = lowestCommonAncestorRecursive(root.left, p, q, &ancestor)
        let foundRight = lowestCommonAncestorRecursive(root.right, p, q, &ancestor)
        let foundCurrent = (root.val == p.val) || (root.val == q.val)
        
        if foundLeft.toInt + foundRight.toInt + foundCurrent.toInt >= 2 {
            ancestor = root
            return false
        }
        
        return foundLeft || foundRight || foundCurrent
    }
}

extension Bool {
    var toInt: Int {
        return self ? 1 : 0
    }
}