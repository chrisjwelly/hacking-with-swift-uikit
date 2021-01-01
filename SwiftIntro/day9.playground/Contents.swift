import UIKit

// MARK: Initializers
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

// var user = User(username: "twostraws")
// Instead of above:
var user = User()
user.username = "twostraws"

// MARK: Referring to the current instance
struct Person2 {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var person2 = Person2(name: "John")

// MARK: Lazy Properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    // With the lazy keyword, the family tree won't be initialized just yet
    // If you run it, you won't see family tree printed message
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

// MARK: Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed2 = Student(name: "Ed")
let taylor = Student(name: "Taylor")

// Cannot be accessed via the instance variables
print(Student.classSize)

// MARK: Access Control
struct Person3 {
    // Only methods can access it
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func indentify() -> String {
        return "My SSN is \(id)"
    }
}

let ed3 = Person3(id: "1235")
ed3.indentify()
