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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // the first element of preorder is the root of our tree
        guard let rootVal = preorder.first else { return nil }
        let root = TreeNode(rootVal)
        
        // find the index of the root element in the inorder list.
        // this is key: elements to the left of this index
        // are in the left subtree, and elements to the right of this index are
        // in the right subtree.
        guard let index = inorder.firstIndex(of: rootVal) else { return nil }
        
        let preorderL = Array(preorder[1..<index+1]) // skip the first element, since that's the root
        let preorderR = Array(preorder[index+1..<preorder.count])
        let inorderL = Array(inorder[..<index])
        let inorderR = Array(inorder[index+1..<inorder.count])
        
        root.left = buildTree(preorderL, inorderL)
        root.right = buildTree(preorderR, inorderR)
        
        return root
    }
}