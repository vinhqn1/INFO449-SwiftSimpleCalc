//: # Welcome to the UW Calculator Playground (Simple Version)
//:
print("Welcome to the UW Calculator Playground")


func calculate(_ args: [String]) -> Int {
    let trad = ["+", "-", "*", "/", "%"]
    let nonTrad = ["count", "avg", "fact", "sum"]
    let count = args.count
    
    if count == 1 {
        return 0
    } else if nonTrad.contains(args.last!) {
        let nums = args[0 ..< count].compactMap { Int($0) }
        switch args.last {
        case "count":
            return nums.count
        case "sum":
            var sum = 0
            for i in nums{
                sum += i
            }
            return sum
        case "avg":
            var sum = 0
            for i in nums{
                sum += i
            }
            return sum / nums.count
        case "fact":
            func factFunc(n: Int) -> Int {
                if n == 0 { return 1 }
                return n * factFunc(n: n-1)
            }
            return factFunc(n: nums[0])
        default: break
        }
    } else if trad.contains(args[1]) && count == 3 {
        guard let left: Int = Int(args[0]) else { return 0 }
        guard let right: Int = Int(args[2]) else { return 0 }
        switch args[1] {
        case "+":
            return left + right
        case "-":
            return left - right
        case "*":
            return left * right
        case "/":
            return left / right
        case "%":
            return left - (right * (left / right))
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
    let count = args.count
    
    if count == 1 {
        return 0.0
    } else if nonTrad.contains(args.last!) {
        let nums = args[0 ..< args.count].compactMap { Double($0) }
        switch args.last {
        case "count":
            return Double(nums.count)
        case "avg":
            var sum = 0.0
            for i in nums {
                sum += i
            }
            return sum / Double(nums.count)
        case "sum":
            var sum = 0.0
            for i in nums {
                sum += i
            }
            return sum
        default: break
        }
    } else if trad.contains(args[1]) && count == 3 {
        guard let left: Double = Double(args[0]) else { return 0.0 }
        guard let right: Double = Double(args[2]) else { return 0.0 }
        switch args[1] {
        case "+":
            return left + right
        case "-":
            return left - right
        case "*":
            return left * right
        case "/":
            return left / right
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
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0

