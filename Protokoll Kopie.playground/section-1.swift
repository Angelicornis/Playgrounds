// Playground - noun: a place where people can play

import Cocoa
import Foundation

let berechnungsString = "12+34*2+56:2"
func parser(#stringZuParsen: String, mitWelchemSeparator separator: String, berechne:Bool = false) ->[String] {
    var stringZuParsenGeparst = stringZuParsen.componentsSeparatedByString(separator)
    if berechne {
        var temp = 0
        var ergebnis: Int?
        var wert = ArrayWertAusgabe(vonWelchemArray: stringZuParsenGeparst, 0)
        //var wertInt = wert!.toInt()
        for wertInt in stringZuParsenGeparst {
            switch separator {
            case "*":
                if ergebnis == nil {
                    ergebnis = wert!.toInt()!
                } else {
                    ergebnis! *= wertInt.toInt()!
                }
            case ":":
                if ergebnis == nil {
                    ergebnis = wert!.toInt()!
                } else {
                    ergebnis! /= wertInt.toInt()!
                }
            default: ergebnis! = 0
            }
        }
        return ["\(ergebnis!)"]
    } else {
        return stringZuParsenGeparst
    }
}
func ArrayWertAusgabe<T>(vonWelchemArray ausgewähltesArray: [T], index: Int) ->T? {
    var ergebnis: T?
    for (key, value) in enumerate(ausgewähltesArray) {
        if key == index {
            ergebnis = value
        }
    }
    return ergebnis
}


var arrayOfWords = parser(stringZuParsen: berechnungsString, mitWelchemSeparator: "+")
println("Ergebniss1: \n \(arrayOfWords)\n")


var arrayOfWords2 = [String]()
var temparray = [Int]()
for (index1, wort1) in enumerate(arrayOfWords) {
    for c in wort1 {
        if c == "*" {
            println ("String vor dem zweiten Parsen * \n \(wort1)\n")
            arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "*", berechne: true))
            temparray.append(index1)
            for i in arrayOfWords2 {
                arrayOfWords.removeAtIndex(index1)
                arrayOfWords.insert(i, atIndex: index1)
            }
        } else if c == ":" {
            println ("String vor dem zweiten Parsen : \n \(wort1)\n")
            arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: ":", berechne: true))
            temparray.append(index1)
            for i in arrayOfWords2 {
                arrayOfWords.removeAtIndex(index1)
                arrayOfWords.insert(i, atIndex: index1)
            }
        }
    }
}
println("Ergebniss2: \n \(arrayOfWords)\n")

println("Das letzte Vorergebnis Lautet: \n \(arrayOfWords)\n")
var ergebnis = 0
for i in arrayOfWords {
    ergebnis += i.toInt()!
}
println("Das Ergebnis Lautet: \n \(ergebnis)\n")
