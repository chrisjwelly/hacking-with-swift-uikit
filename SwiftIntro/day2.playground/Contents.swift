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

// MARK: Arrays vs Sets vs Tuples
// Specific fixed collection related values, precise position: Tuple
// Retrieve quickly and unique: Set
// Contain duplicate and order: Array

// MARK: Dictionaries
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
// Separated just like array, square brackets and comma-separated
// Type annotation: [String: Double], [String: String], [String: Bool], [Int: String]

// MARK: Dictionary Default Values
// Key doesn't exist? Swift send `nil`

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]
favoriteIceCream["Chris"]
favoriteIceCream["Chris", default: "Vanilla"]

// MARK: Creating Empty Collections
// Empty Dictionary
var teams = [String: String]()
teams["Paul"] = "Red"

// Empty Array
var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

// Alt for Dict and Array
var scores = Dictionary<String, Int>()
var results2 = Array<Int>()

// MARK: Enumerations
enum Result {
    case success
    case failure
}

let result = Result.success
let result2 = Result.failure

// MARK: Enum Associated Values
// Attach information to enums so they can represent more nuanced data
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

// MARK: Enum raw values
enum Planet: Int {
    case mercury = 1 // otherwise we start from 0
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)

// MARK: Summary
/*
 * 1. Collections store a group of items under a single value
 * 2. Arrays store in order of adding, access with numerical positions
 * 3. Sets store items without any order, so you can't access using numerical
 * 4. Tuples fixed in size, can attach names to each of their items. Read items using
 *    numerical positions or using names
 * 5. Dictionaries store items according to a key, and you can read item using those keys
 * 6. Enum to group related values without spelling mistakes
 * 7. Attach raw values to enums so they can be created from integers or strings. Add your
 *    own associated values to store additional info about each case also possible
 */
