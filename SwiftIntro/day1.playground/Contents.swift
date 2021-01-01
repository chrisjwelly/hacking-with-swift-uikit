import UIKit

// MARK: Variables
var str = "Hello Playground"
str = "Goodbye"
// This cannot be typecasted to a int. Because this is a str

// MARK: Strings and Integers
var age = 38
// Can use underscores and make it easier to read
var population = 8_000_000

// MARK: Multi-line Strings
var str1 = """
This goes
over multiple lines
"""

var str2 = """
This goes \
over multiple \
lines
"""

// MARK: Doubles and Booleans
// Double-precision floating-point number. Fancy way of saying it holds fractional values
var pi = 3.141
var awesome = true

// MARK: String interpolation
var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"

// MARK: Constants
let taylor = "swift"

// MARK: Type annotations
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

// MARK: Summary
/*
 * 1. You make variables using `var` and constants with `let`
 * 2. Strings start and end with double quotes,
 * 3. Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false
 * 4. String interpolation allows you to create strings from other variables
 *    and constants, placing their values inside your string
 * 5. Swift uses type inference to assign types, but can provide explicit types
 */
