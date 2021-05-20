
class LRUCache {
    
    private var cache = [Int: Node]()
    
    // dummy nodes to mantain boundaries
    private let head = Node(key: -1, val: -1)
    private let tail = Node(key: -1, val: -1)
    
    private let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
        
        // hook up dummy boundary nodes to each other
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else { return -1 }
        
        // remove the node from its position and hook up neighbors
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev

        // move existing node to head
        insertHead(node)

        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let existingNode = cache[key] {
            existingNode.val = value // update the val if necessary

            // remove the existing node from its position and hook up its neighbors
            existingNode.prev?.next = existingNode.next
            existingNode.next?.prev = existingNode.prev
            
            // move existing node to head
            insertHead(existingNode)
        } else {
            // insert new node to cache
            let node = Node(key: key, val: value)
            cache[key] = node
            
            // move new node to head
            insertHead(node)
            
            // remove lruNode (tail) and remove it from cache if beyond capacity
            if cache.count > capacity {
                guard let evictedNode = evictTail() else { return }
                cache[evictedNode.key] = nil
            }
        }
    }
    
    private func insertHead(_ node: Node) {
        // remember, head is a dummy node so the first real node is next
        guard let firstNode = head.next else {
            head.next = node
            return
        }
        
        // insert new node in the front of our double linked list
        head.next = node
        node.prev = head
        node.next = firstNode
        firstNode.prev = node
    }
    
    private func evictTail() -> Node? {
        guard let lruNode = tail.prev else { return nil } // remember, tail is a dummy boundary node
        
        let prev = lruNode.prev
        tail.prev = prev
        prev?.next = tail
        
        return lruNode
    }
}

class Node {
    let key: Int
    var val: Int
    var prev: Node?
    var next: Node?

    init(key: Int, val: Int) {
        self.key = key
        self.val = val
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */