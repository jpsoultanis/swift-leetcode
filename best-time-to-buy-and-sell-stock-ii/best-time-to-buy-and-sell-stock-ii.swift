class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        
        for (index, price) in prices.enumerated() {
            guard index >= 1 else { continue }
            if price > prices[index - 1] {
                maxProfit += price - prices[index - 1]
            }
        }
        
        return maxProfit
    }
}