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
    // convert trees to strings using preorder traversal, compare strings
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        var rootStr = ""
        treeToString(root, &rootStr)
        
        var subRootStr = ""
        treeToString(subRoot, &subRootStr)
        
        return rootStr.contains(subRootStr)
    }
    
    func treeToString(_ root: TreeNode?, _ output: inout String) {
        guard let root = root else {
            output += " null"
            return
        }
        
        let nodeStr = " #" + String(root.val)
        output += nodeStr
        
        treeToString(root.left, &output)
        treeToString(root.right, &output)
    }
    
    /* Recursive solution comparing nodes
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        return findCommonRoot(root, subRoot)
    }
    
    func findCommonRoot(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        return equals(root, subRoot) || 
            findCommonRoot(root.left, subRoot) || 
            findCommonRoot(root.right, subRoot)
    }
    
    func equals(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        // base case
        if root == nil && subRoot == nil {
            return true
        }
        
        guard let root = root, let subRoot = subRoot else { return false }
        
        // found common root values, now check that their children are equal via recursion
        if root.val == subRoot.val {
            return equals(root.left, subRoot.left) && equals(root.right, subRoot.right)
        } else {
            return false
        }
    }
    */
}