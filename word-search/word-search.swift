class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !board.isEmpty, !board[0].isEmpty else { return false }
        guard !word.isEmpty else { return true }
        
        var word = Array(word)
        var board = board
        let firstLetter = word.removeFirst()
        
        // scan through grid and when we find a matching first letter, do a DFS to try and
        // find the whole word
        for i in 0 ..< board.count {
            for j in 0 ..< board[0].count {
                if board[i][j] == firstLetter {
                    if dfs(board, j, i, 0, word) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    private func dfs(_ board: [[Character]],
                     _ x: Int, 
                     _ y: Int,
                     _ curIndex: Int,
                     _ word: [Character]) -> Bool {
        // base case
        // once we've found every letter in word, we've found the word
        guard curIndex < word.count else { return true }      
        
        // remove char at this position to mark visited for all dfs stack frames on top this one
        var board = board
        board[y][x] = "-" 
        
        let nextChar = word[curIndex] // get next letter we'll be looking for in our dfs
        
        // cardinal directions
        let moves = [(1, 0), (0, 1), (0, -1), (-1, 0)]
                
        for (dx, dy) in moves {
            let x = x + dx
            let y = y + dy
            
            // if move is in-bounds and contains the letter we're looking for next...
            if isValidMove(board, x, y) && board[y][x] == nextChar {
                if dfs(board, x, y, curIndex + 1, word) {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func isValidMove(_ board: [[Character]],
                            _ x: Int, 
                            _ y: Int) -> Bool {
        return y < board.count &&
            y >= 0 &&
            x < board[0].count &&
            x >= 0
    }
}