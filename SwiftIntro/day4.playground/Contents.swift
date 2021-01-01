import UIKit

// MARK: For Loops
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}

// MARK: While Loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here i come!")

// MARK: Repeat Loop
// Identical to while, but check at the end
var number2 = 1
repeat {
    print(number2)
    number2 += 1
} while number <= 20

repeat {
    print("This is false")
} while false

// MARK: Exiting Loops
var countDown = 10
while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }
    countDown -= 1
}

print("Blast off")

// MARK: Exiting Multiple Loops
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bull's eye!")
            break outerLoop
        }
    }
}

// MARK: Skipping Items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print(i)
}

// MARK: Infinite Loops
var counter = 0
while true {
    print(" ")
    counter += 1
    
    if counter == 273 {
        print("Oh time to break!")
        break
    }
}
