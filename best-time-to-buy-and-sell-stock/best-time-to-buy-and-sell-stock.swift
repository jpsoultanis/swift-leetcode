class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = -1
        var maxPrice = -1
        
        for price in prices.reversed() {
            if price > maxPrice {
                maxPrice = price
            }
            if maxPrice - price > maxProfit {
                maxProfit = maxPrice - price
            }
        }
        
        return maxProfit
    }
}