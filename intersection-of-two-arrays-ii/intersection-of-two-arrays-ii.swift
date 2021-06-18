class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // create map that indicates how many times each integer has been found
        var intFreqMap = [Int: Int]()
        for num in nums2 {
            intFreqMap[num, default: 0] += 1
        }
        
        var result = [Int]()
        for num in nums1 {
            // if the other array contains the same item, append to results and decrement int count
            // to represent that int as "used"
            if let frequency = intFreqMap[num] {
                intFreqMap[num] = (frequency > 1) ? (frequency - 1) : nil
                result.append(num)
            }
        }
        return result
    }
}