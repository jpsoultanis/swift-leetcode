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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var results = [[Int]]()
        pathSumRecursive(root, targetSum, [], &results)
        
        return results
    }
    
    func pathSumRecursive(_ root: TreeNode?, _ remaining: Int, _ curPath: [Int], _ results: inout [[Int]]) {
        guard let root = root else { return }
        
        let remaining = remaining - root.val
        var curPath = curPath
        curPath.append(root.val)
        
        if root.left == nil && root.right == nil && remaining == 0 {
            results.append(curPath)
            return
        }
        
        pathSumRecursive(root.left, remaining, curPath, &results)
        pathSumRecursive(root.right, remaining, curPath, &results)
    }
}