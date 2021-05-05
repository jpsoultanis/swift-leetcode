class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var answers = [[Int]]()
        var arr = [Int]()
        
        helper(nums, arr: &arr, answers: &answers)
        return answers
    }
    
    func helper(_ numsRemaining: [Int], arr: inout [Int], answers: inout [[Int]]) {        
        guard !numsRemaining.isEmpty else {
            // with no numbers remaining to permute, we have found a solution.
            // append contents of arr to our list of answers
            answers.append(arr)
            return
        }
        
        for i in 0..<numsRemaining.count {
            // pull a num out of the remaining numbers and add it to our arr 
            // to continue building a permutation
            let usedNum = numsRemaining[i]
            arr.append(usedNum)
            
            // create a new array of remaining numbers that excluses the one we just removed
            var newNumsRemaining = [Int]()
            for (index, value) in numsRemaining.enumerated() {
                if index != i {
                    newNumsRemaining.append(value)
                }
            }
            
            // recurse
            helper(newNumsRemaining, arr: &arr, answers: &answers)
            
            // at this point, we're done recursing and we've added the contents of arr to our answer.
            // remove the last item
            arr.removeLast()
        }
    }
}