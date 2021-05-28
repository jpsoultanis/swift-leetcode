class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        
        var writeIndex = 0
        
        // swap all non-zero elements to the front, which will 
        // maintain their order and push 0's to the end.
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, writeIndex)
                writeIndex += 1
            }
        }
    }
}