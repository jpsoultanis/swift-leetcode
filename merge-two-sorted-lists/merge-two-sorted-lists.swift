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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        
        // create a pointer for each linked list
        var cur1 = l1
        var cur2 = l2
        
        // keep a reference to a dummy head to make
        // returning the true head easier
        let dummyHead = ListNode()
        var curNode = dummyHead
        
        // iterate until both linked list pointers have
        // progressed through all values
        while cur1 != nil || cur2 != nil {
            switch (cur1, cur2) {
            case (.some(let lhs), .some(let rhs)):
                // if both pointers have valid data, pick the smaller node
                if lhs.val <= rhs.val {
                    curNode.next = lhs
                    cur1 = cur1?.next
                } else {
                    curNode.next = rhs
                    cur2 = cur2?.next
                }
            
            case (.some(let lhs), _):
                curNode.next = lhs
                cur1 = cur1?.next
            
            case (_, .some(let rhs)):
                curNode.next = rhs
                cur2 = cur2?.next
                
            case (nil, nil):
                continue // shouldn't happen due to "while" conditions
            }
            curNode = curNode.next!
        }
        
        // return the node after our dummy, which is the true head
        // of our merged linked list
        return dummyHead.next
    }
}