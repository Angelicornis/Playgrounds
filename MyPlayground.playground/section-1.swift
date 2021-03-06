// Playground - noun: a place where people can play

import Cocoa
import Foundation

extension Array {
    mutating func addierValue(mitStartwert valueF: Int){
        var temp = 0
        for (key, value) in enumerate(self) {
            temp = (value as Int) + valueF
            self.removeAtIndex(key)
            self.insert(temp as T, atIndex: key)
        }
    }
    func valueOf(Index: Int) -> T? {
        for (key, value) in enumerate(self) {
            if key == Index {
                return value
            }
        }
        return nil
    }
    mutating func replace (withArray: [T], var atIndex: Int) {
        self.removeAtIndex(atIndex)
        for (key, value) in enumerate(withArray) {
            self.insert(value, atIndex: atIndex)
            atIndex += 1
        }
    }
    
}
func parser(#stringZuParsen: String, mitWelchemSeparator separator: String, berechne:Bool = false) ->[String] {
    var stringZuParsenGeparst = stringZuParsen.componentsSeparatedByString(separator)
    if berechne {
        var temp = 0
        var ergebnis: Int?
        var wert = stringZuParsenGeparst.valueOf(0)
        for wertInt in stringZuParsenGeparst {
            switch separator {
            case "x":
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
func berechnung(StringZumBerechnen anzeigeWährendBerechnung: String) -> Int {
    var arrayOfWords = parser(stringZuParsen: anzeigeWährendBerechnung, mitWelchemSeparator: "+")

    var arrayOfWords2 = [String]()
    var parameter: [Int] = []
    for (var index1, wort1) in enumerate(arrayOfWords) {
        var temp = false
        for  c in wort1 {
            if c == "-" {
                temp = true
            }
        }
        
        if temp {
            var index2 = index1
            arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "-"))
            arrayOfWords.removeAtIndex(index1)
            for (key, value) in enumerate(arrayOfWords2) {
                arrayOfWords.insert(value, atIndex: index2)
                index2 += 1
                if key != 0 {
                    parameter.append(key)
                }
            }
            parameter.addierValue(mitStartwert: 1)
        }
    }
    
    for (index1, wort1) in enumerate(arrayOfWords) {
        for c in wort1 {
            if c == "x" {
                //            println ("String vor dem zweiten Parsen * \n \(wort1)\n")
                arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "x", berechne: true))
                for i in arrayOfWords2 {
                    arrayOfWords.removeAtIndex(index1)
                    arrayOfWords.insert(i, atIndex: index1)
                }
            } else if c == ":" {
                //            println ("String vor dem zweiten Parsen : \n \(wort1)\n")
                arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: ":", berechne: true))
                for i in arrayOfWords2 {
                    arrayOfWords.removeAtIndex(index1)
                    arrayOfWords.insert(i, atIndex: index1)
                }
            }
        }
    }
    println("parameter \(parameter)")
    var ergebnis = 0
    for (key, value) in enumerate(arrayOfWords) {
        var status = true
        var value2: Int = 0
        for (key2, value2) in enumerate(parameter) {
            println("key: \(key); value: \(value2)")
            if key == value2 {
                ergebnis = ergebnis - value.toInt()!
                parameter.removeAtIndex(key2)
//                                println(" 1 - \n Ergebnis: \(ergebnis)\n Value: \(value)")
                
                status = false
            }
        }
        if status {
            ergebnis = ergebnis + value.toInt()!
//                        println(" 2 - \n Ergebnis: \(ergebnis)\n Value: \(value)")
            
        }
        
    }
    return ergebnis
}


var anzeigeWährendBerechnung = "2x5x(8+2)x(10-5)"
println("Startwert\n \(anzeigeWährendBerechnung) \n")

var a = parser(stringZuParsen: anzeigeWährendBerechnung, mitWelchemSeparator: "(")
//println("Startwert\n \(a)")
a.removeAtIndex(0)
//println("Nach Entfernen\n \(a)")

var b: [String] = []
for (key, value) in enumerate(a) {
    b += (parser(stringZuParsen: value, mitWelchemSeparator: ")"))
    b.removeAtIndex(key + 1)
}
//println("Nach Parsen \n \(b)")


a = parser(stringZuParsen: anzeigeWährendBerechnung, mitWelchemSeparator: "(")
var key1 = 0
for (var key, value) in enumerate(a) {
//    println("key: \(key1)")
//    println(key1)
    var aA = parser(stringZuParsen: value, mitWelchemSeparator: ")")
    if aA.count > 1 {
        aA[0] = "\(berechnung(StringZumBerechnen: aA[0]))"
    }
//    println("aA: \(aA)")
    a.replace(aA, atIndex: key1)
    if aA.count > 1 {
        for number in 0..<aA.count {
            key1 += 1
        }
    } else {
        key1 += 1
    }
//    println(key1)
//    println("replace: \(a) \n \n")
}
anzeigeWährendBerechnung = ""
for (key, value) in enumerate(a) {
    anzeigeWährendBerechnung += value
//    println(anzeigeWährendBerechnung)
}

//berechnung(StringZumBerechnen: anzeigeWährendBerechnung)



//berechnung(StringZumBerechnen: anzeigeWährendBerechnung)
