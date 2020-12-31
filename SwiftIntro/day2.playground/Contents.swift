import UIKit

// MARK: Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starrr"

let beatles = [john, paul, george, ringo]
beatles[1]

// Type annotations: [String], [Bool], [Int], [Double]

// MARK: Sets
// Effectively random order
// All items must be unique
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "red"]) // the other red is ignored

// MARK: Tuples
/*
 * 1. Can't add or remove items from a tuple. Fixed size
 * 2. Can't change the type of items in a tuple, they
 *    always have the same types they were created with
 * 3. Can access using numerical positions or by naming
 */
var name = (first: "Taylor", last: "Swift")
name.0
name.first
// Recall: Can change values, but not *types* of values
