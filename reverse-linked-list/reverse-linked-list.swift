/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        reverseListIterative(head)
    }
    
    func reverseListIterative(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curNode = head
        
        while curNode != nil {
            let tmp = curNode?.next
            
            // flip the direction
            curNode?.next = prev
            
            // advance pointers by 1
            prev = curNode
            curNode = tmp
        }
        
       return prev
    }
    
    func reverseListRecursive(_ node: ListNode?) -> ListNode? {
        // base case: stop at the last node
        guard let curNode = node, curNode.next != nil else { return node }
        
        // recursive step
        let head = reverseListRecursive(curNode.next)

        // reverse the list direction
        curNode.next?.next = curNode
        curNode.next = nil
        
        return head
    }
}
