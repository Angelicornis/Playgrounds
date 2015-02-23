// Playground - noun: a place where people can play

import Cocoa
import Foundation

let berechnungsString = "12+34*2+562"
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
        arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "*", berechne: true))
        temparray.append(index1)
        for i in arrayOfWords2 {
            arrayOfWords.removeAtIndex(index1)
            arrayOfWords.insert(i, atIndex: index1)
        }
    }
}
println("Ergebniss2: \n \(arrayOfWords)\n")

println("Das letzte Vorergebnis Lautet: \n \(arrayOfWords)\n")
