import UIKit

// MARK: Arithmetic Operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % firstScore

// MARK: Operator Overloading
// + also joins string
let actions = "Haters gonna " + "hate"

let firstHalf = ["John", "Paul"]
let secondHalf = ["Christian", "James"]
let combined = firstHalf + secondHalf

// MARK: Compound assignment operators
var score = 95
score -= 5

var quote = "The rain in Spain mainly falls on the"
quote += " rainiest place"

// MARK: Comparison operators
// ==, !=, <, <=

// MARK: Conditions
let firstCard = 11
let secondCard = 10

if (firstCard + secondCard) == 2 {
    print("Aces A Lucky!")
} else if (firstCard + secondCard) == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// MARK: Combining conditions
// && and, || or

// MARK: Ternary Operator
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

// MARK: Switch statements
let weather = "sunny"
switch weather {
case "rain":
    print("Bring umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    // fallthrough // use this keyword if you wanna continue execution
default:
    print("Enjoy your day!")
}

// MARK: Range operators
// Use ..< and ...
// ..< excludes the final value
// ... includes the final value

switch score {
case 0..<50:
    print("You failed badly")
case 50..<85:
    print("You did ok.")
default:
    print("You did great!")
}

