/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head else { return false }
        
        var curNode: ListNode? = head
        var runner: ListNode? = head.next
        
        while curNode != nil, runner != nil {
            guard curNode !== runner else { return true }
            curNode = curNode?.next
            runner = runner?.next?.next
        }
        
        return false
    }
}