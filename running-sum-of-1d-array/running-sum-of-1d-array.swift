class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        return nums.reduce([]) { (sumsArray: [Int], num: Int) in
            guard let last = sumsArray.last else { return [num] } // should only return for first element
            return sumsArray + [last + num]
        }
    }
}
