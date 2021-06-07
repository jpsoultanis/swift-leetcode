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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        recursive(root, &sum, low, high)
        return sum
    }
    
    func recursive(_ root: TreeNode?, _ runningSum: inout Int, _ low: Int, _ high: Int) {
        guard let root = root else { return }
        
        if root.val >= low && root.val <= high {
            runningSum += root.val
        }
        
        if low < root.val {
            recursive(root.left, &runningSum, low, high)
        }
        
        if high > root.val {
            recursive(root.right, &runningSum, low, high)
        }
    }
}