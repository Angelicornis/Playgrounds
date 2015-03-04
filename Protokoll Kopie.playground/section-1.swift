// Playground - noun: a place where people can play

import Cocoa
import Foundation


//extension Array {
//    func isInArray<T>(thisArray: [T], thisCharakter char: Character) -> Bool {
//        for value in self {
//            for c in value {
//                if c == "-" {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//}



var array =  ["120", "30-50-20"]


//array.isInArray(thisCharakter: "-")

func isInArray<T>(thisArray: T, thisCharakter char: T) -> Bool {
        for  c in thisArray {
            if c == char {
                return true
            }
        }
    return false
}

var temp = false
for value in array {
    for  c in value {
        if c == "-" {
            temp = true
        }
    }
}

if temp {
    println ("Ja")
}











