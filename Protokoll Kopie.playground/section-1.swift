// Playground - noun: a place where people can play

import Cocoa
import Foundation

let berechnungsString = "123+456+789*2*4+9+6*2"
func parser(#stringZuParsen: String, mitWelchemSeparator separator: String, berechne:Bool = false) ->[String] {
    var stringZuParsenGeparst =  stringZuParsen.componentsSeparatedByString(separator)
    
    if berechne {
        var temp = 0
        var ergebnis = 1
        for wert in stringZuParsenGeparst {
            var wertInt = wert.toInt()
            ergebnis *= wertInt!
        }
        return ["\(ergebnis)"]
    } else {
        return stringZuParsenGeparst
    }
}

var arrayOfWords = parser(stringZuParsen: berechnungsString, mitWelchemSeparator: "+")
println("Ergebniss1: \n \(arrayOfWords)\n")


var arrayOfWords2 = [String]()
var temparray = [Int]()
for (index1, wort1) in enumerate(arrayOfWords) {
    if wort1.toInt() == nil {
        println ("String vor dem zweiten Parsen \n \(wort1)\n")
        arrayOfWords2 += (parser(stringZuParsen: wort1, mitWelchemSeparator: "*", berechne: true))
        temparray.append(index1)
        arrayOfWords.removeAtIndex(index1)
        for i in arrayOfWords2 {
            arrayOfWords.insert(i, atIndex: index1)
        }
    }
}

println(arrayOfWords)
