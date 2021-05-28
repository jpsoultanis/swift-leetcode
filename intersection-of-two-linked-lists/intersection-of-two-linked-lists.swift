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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard let headA = headA, let headB = headB else { return nil }

        let aCount = getCount(headA)
        let bCount = getCount(headB)
        
        var curA: ListNode? = headA
        var curB: ListNode? = headB
        
        // offset pointer of longer list so both lists have same number of remaining nodes
        if aCount < bCount {
            for _ in 1...(bCount - aCount) {
                curB = curB?.next
            }
        } else if bCount < aCount {
            for _ in 1...(aCount - bCount) {
                curA = curA?.next
            }
        }
        
        // step through each list at the same pace. 
        // return early if we find the same node instance in both.
        while curA != nil && curB != nil {
            guard curA !== curB else { return curA }
            
            curA = curA?.next
            curB = curB?.next
        }
        
        return nil
    }
    
    private func getCount(_ head: ListNode) -> Int {
        var count = 0
        var curNode: ListNode? = head
        
        while curNode != nil {
            count += 1
            curNode = curNode?.next
        }
        
        return count
    }
}

