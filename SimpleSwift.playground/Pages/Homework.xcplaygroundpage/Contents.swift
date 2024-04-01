//: # Welcome to the UW Calculator Playground (Simple Version)
//:
print("Welcome to the UW Calculator Playground")


func calculate(_ args: [String]) -> Int {
    let trad = ["+", "-", "*", "/", "%"]
    let nonTrad = ["count", "avg", "fact", "sum"]
    func addFunc(left: Int, right: Int) -> Int { return left + right}
    func subtractFunc(left: Int, right: Int) -> Int { return left - right}
    func multiplyFunc(left: Int, right: Int) -> Int { return left * right}
    func divideFunc(left: Int, right: Int) -> Int { return left / right}
    func modFunc(left: Int, right: Int) -> Int { return left - (right * (left / right)) }
    func countFunc(nums: [Int]) -> Int { return nums.count }
    func sumFunc(nums: [Int]) -> Int {
        var sum = 0
        for i in nums{
            sum += i
        }
        return sum
    }
    func avgFunc(nums: [Int]) -> Int {
        let sum = sumFunc(nums: nums)
        return sum / nums.count
    }
    func factFunc(n: Int) -> Int {
        if n == 0 { return 1 }
        return n * factFunc(n: n-1)
    }
    
    if args.count == 1 {
        return 0
    } else if nonTrad.contains(args.last!) {
        let nums = args[0 ..< args.count].compactMap { Int($0) }
        switch args.last {
        case "count":
            return countFunc(nums: nums)
        case "sum":
            return sumFunc(nums: nums)
        case "avg":
            return avgFunc(nums: nums)
        case "fact":
            return factFunc(n: nums[0])
        default: break
        }
    } else if (trad.contains(args[1])) && (args.count == 3) {
        guard let left: Int = Int(args[0]) else { return 0 }
        guard let right: Int = Int(args[2]) else { return 0 }
        switch args[1] {
        case "+":
            return addFunc(left: left, right: right)
        case "-":
            return subtractFunc(left: left, right: right)
        case "*":
            return multiplyFunc(left: left, right: right)
        case "/":
            return divideFunc(left: left, right: right)
        case "%":
            return modFunc(left: left, right: right)
        default: break
        }
    }
    return 0
}

func calculate(_ arg: String) -> Int {
    let argSplit = arg.split(separator: " ")
    let argArray: [String] = argSplit.map { (substring) in String(substring) }
    return calculate(argArray)
}
//: Below this are the test expressions/calls to verify if your code is correct.
//:
//: ***DO NOT MODIFY ANYTHING BELOW THIS***
//: -------------------------------------------
//: All of these expressions should return true
//: if you have implemented `calculate()` correctly

calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

//: -------------------------------------------
//: These are extra credit tests; they are commented out 
//: so that they do not conflict with you work until you 
//: choose to implement them.
//: Uncomment them to turn them on for evaluation.
//:
//: Implement `calculate([String])` and `calculate(String)` to handle negative numbers. You need only make the tests below pass. (You do not need to worry about "fact"/factorial with negative numbers, for example.)
//:
//: This is worth 1 pt

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

//: Implement `calculate([String])` and `calculate(String)` to use 
//: and return floating-point values. You need only make the tests 
//: below pass. (Factorial of floating-point numbers doesn't make 
//: much sense, either.)
//:
//: Swift *will* allow you to overload based on return types, so 
//: the below functions can co-exist simultaneously with the 
//: Integer-based versions above.
//: 
//: This is worth 1 pt

func calculate(_ args: [String]) -> Double {
    let trad = ["+", "-", "*", "/"]
    let nonTrad = ["count", "avg", "sum"]
    func addFunc(left: Double, right: Double) -> Double { return left + right}
    func subtractFunc(left: Double, right: Double) -> Double { return left - right}
    func multiplyFunc(left: Double, right: Double) -> Double { return left * right}
    func divideFunc(left: Double, right: Double) -> Double { return left / right}
    func countFunc(nums: [Double]) -> Double { return Double(nums.count) }
    func sumFunc(nums: [Double]) -> Double {
        var sum = 0.0
        for i in nums {
            sum += i
        }
        return sum
    }
    func avgFunc(nums: [Double]) -> Double {
        let sum = sumFunc(nums: nums)
        return sum / Double(nums.count)
    }
    
    if args.count == 1 {
        return 0.0
    } else if nonTrad.contains(args.last!) {
        let nums = args[0 ..< args.count].compactMap { Double($0) }
        switch args.last {
        case "count":
            return countFunc(nums: nums)
        case "avg":
            return avgFunc(nums: nums)
        case "sum":
            return sumFunc(nums: nums)
        default: break
        }
    } else if (trad.contains(args[1])) && (args.count == 3) {
        guard let left: Double = Double(args[0]) else { return 0 }
        guard let right: Double = Double(args[2]) else { return 0 }
        switch args[1] {
        case "+":
            return addFunc(left: left, right: right)
        case "-":
            return subtractFunc(left: left, right: right)
        case "*":
            return multiplyFunc(left: left, right: right)
        case "/":
            return divideFunc(left: left, right: right)
        default: break
        }
    }
    return 0.0
}
func calculate(_ arg: String) -> Double {
    let argSplit = arg.split(separator: " ")
    let argArray: [String] = argSplit.map { (substring) in String(substring) }
    return calculate(argArray)
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
// technically not implemented properly but the concept of modulo was made for ints.
// and it was mentioned in class to not do modulo (i believe)
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0

