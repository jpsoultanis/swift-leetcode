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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var sortedItems = [Int]()
        kthSmallestRecursive(root, k, &sortedItems)
        
        return sortedItems[k - 1]
    }
    
    func kthSmallestRecursive(_ root: TreeNode?, _ k: Int, _ sortedItems: inout [Int]) {
        guard let root = root else { return }
        
        kthSmallestRecursive(root.left, k, &sortedItems)
        
        sortedItems.append(root.val)
        guard sortedItems.count < k else { return }
        
        kthSmallestRecursive(root.right, k, &sortedItems)
        
        return
    }
}