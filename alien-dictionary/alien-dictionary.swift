class Solution {
    func alienOrder(_ words: [String]) -> String {
        guard !words.isEmpty else { return "" }
        
        var order = [Character]()
        
        // adjacency list where each key is lexiographically
        // before all values in its set
        let graph: [Character: Set<Character>] = buildGraph(from: words)

        // map of how many incoming edges each character in our graph has.
        // chars with 0 incoming edges are lexiographically before others.
        var indegreeMap: [Character: Int] = buildIndegreeMap(fromGraph: graph)
        
        // for BFS
        var queue = [Character]()
        
        // setup initial queue using characters
        // that don't come after any other characters
        for (char, count) in indegreeMap {
            if count == 0 {
                queue.append(char)
            }
        }
        
        while !queue.isEmpty {
            let char = queue.removeFirst()
            
            // if we found a letter that doesn't come after any other letters,
            // add it to our "order"
            if indegreeMap[char] == 0 {
                order.append(char)
            }
            
            // Get the letters that come after the one we just found the order for.
            //
            // Since we just placed the letter these adjacent letters depend on in our order, 
            // reduce the number of inbound edges for each adjacent letter
            guard let adjSet = graph[char] else { continue }
            for adjChar in adjSet {
                guard let indegree = indegreeMap[adjChar] else { continue }
                indegreeMap[adjChar] = indegree - 1
                
                if (indegree - 1) == 0 {
                    // if we've discovered a node that now has no inbound edges,
                    // add to queue to be placed lexiographically.
                    queue.append(adjChar)
                }
            }
        }
        
        // computed order should contain every unique character.
        // if not, there was an issue with the data (cycle in adjGraph)
        guard order.count == graph.keys.count else { return "" }
        
        return String(order)
    }
    
    private func buildGraph(from words: [String]) -> [Character: Set<Character>] {
        var graph = [Character: Set<Character>]()
        
        // add all unique letters to graph keys
        for word in words {
            for char in word {
                graph[char] = []
            }
        }
        
        // create adjacency set for each letter to build letter-order rules.
        // key comes before all values in adjacency set
        for i in 0..<(words.count - 1) {
            let word1 = Array(words[i])
            let word2 = Array(words[i + 1])
            
            // ex: if given ["abc, "ab"], the data is invalid since "ab" should be first
            if word1.count > word2.count && words[i].hasPrefix(words[i + 1]) {
                return [:]
            }

            guard let rule = getLexOrderRule(word1, word2) else { continue }
            
            // should never continue since we built an empty set for each unique letter
            guard let adjacentSet = graph[rule.before] else { continue } 
            
            var mutableAdjacentSet = adjacentSet
            mutableAdjacentSet.insert(rule.after)
            graph[rule.before] = mutableAdjacentSet
        }
        
        return graph
    }
    
    // Assumes lhs comes before rhs lexiographically.
    // Returns a lexiographic rule that indicates which character comes before another,
    // if this can be deduced.
    private func getLexOrderRule(_ lhs: [Character], _ rhs: [Character]) -> LexRule? {
        var i = 0
        
        // iterate until we find a char mismatch between two words.
        // when mismatch is found, lhs character proceeds rhs character.
        while i < lhs.count && i < rhs.count {
            guard lhs[i] == rhs[i] else { 
                return LexRule(before: lhs[i], after: rhs[i])
            }
            i += 1
        }
        
        return nil
    }
    
    private func buildIndegreeMap(fromGraph graph: [Character: Set<Character>]) -> [Character: Int] {
        var map = [Character: Int]()
        
        for char in graph.keys {
            map[char] = 0
        }
        
        for (char, adjSet) in graph {
            for adjChar in adjSet {
                map[adjChar, default: 0] += 1
            }
        }
        
        return map
    }
    
    private struct LexRule {
        let before: Character
        let after: Character
    }
}
