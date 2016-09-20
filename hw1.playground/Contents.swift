//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }
    

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: [No, the '!' says that the string is an optional and has a value and that it should be used (they call this forced unwapping), whereas the '?' just says that the value is optional and it's automatically set to nil.]


//: ## Q2: Variable Types and Function Types
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


class func arePalindromes(_ words: [String]) -> Bool {
    let reversedWords = words.map() {String($0.characters.reversed())}
    let numElements = words.count
    
    for i in 0 ..< numElements {
        if words[i] != reversedWords[i] {
            return false
        }
    }
    return true
}



//: [The function needed a return statement and also needed to be declared a class function.]


//: ## Q3: More Functions and Object Initialization

//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


func isAnagram() -> Bool {
    var countLetters = [Character : Int]() //Line X
    let lenA = self.wordA.characters.count
    let lenB = self.wordB.characters.count
    
    if lenA != lenB {
        return false
    }
    
    var arrA = Array(self.wordA.characters)
    var arrB = Array(self.wordB.characters)
    
    for i in 0...lenA-1 {
        let letter = arrA[i]
        if let val = countLetters[letter] { //Line Y
            countLetters[letter] = val + 1
        } else {
            countLetters[letter] = 1
        }
    }
    
    for i in 0...lenB-1 {
        let letter = arrB[i]
        if let val = countLetters[letter] {
            countLetters[letter] = val - 1
        } else {
            return false
        }
    }
    
    for (_, count) in countLetters {
        if count != 0 {
            return false
        }
    }
    
    return true
}


//: [The function had to be changed to return a bool. Also the dictionary needed to be instatiated with empty values and the arrays had to be changed to constants.]
    
    
}

//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
//Words.arePalindromes(["hih", "racecar", "mom", "wow"])
//Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
