// Playground - noun: a place where people can play

import Cocoa
import Foundation

var str = "3x(2+6)"
extension String {
    func lenght () -> Int {
        return countElements(self)
    }
    
    func isInString(thisChar char: Character) ->Bool {
        for c in self {
            if c == char {
                return true
            }
        }
        return false
    }
    
    mutating func removeRange(#range: Int) ->String {
        var temp = self
        self
        var rangeIndex = advance(str.startIndex, 0)
        rangeIndex
        range
        for nummer in 0..<range {
            temp.removeAtIndex(rangeIndex)
        }
        return temp
    }
    
    public func convertRange(range: Range<Int>) -> Range<String.Index> {
        let startIndex = advance(self.startIndex, range.startIndex)
        let endIndex = advance(startIndex, range.endIndex - range.startIndex)
        return Range<String.Index>(start: startIndex, end: endIndex)
    }
}
func componentsSeparatetByStrings(var inString stringToParse: String, separators separatoren: [Character])
    ->(numbers: [String], parameter: [String]) {
        var StringAsArray: [String] = []
        var parameter: [String] = []
        var key = 0
        
        for (var keyy, value) in enumerate(stringToParse) {
            switch value {
            case separatoren[0]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                stringToParse = stringToParse.removeRange(range: key + 1)
                parameter.append("+")
                key = 0
            case separatoren[1]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                stringToParse = stringToParse.removeRange(range: key + 1)
                parameter.append("-")
                key = 0
            default:
                key += 1
            }
        }
        StringAsArray.append(stringToParse)
        stringToParse = ""
        return (StringAsArray, parameter)
}
func componentsSeparatetByStringsWitchCalc(var inString stringToParse: String, separators separatoren: [Character])
    ->String {
        var StringAsArray: [String] = []
        var parameter: [String] = []
        var index: [String] = []
        var indexCounter = 0
        var key = 0
        
        for value in stringToParse {
            switch value {
            case separatoren[0]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                parameter.append("x")
                stringToParse.removeRange(stringToParse.convertRange(0...key))
            case separatoren[1]:
                StringAsArray.append(stringToParse.stringByPaddingToLength(key, withString: "", startingAtIndex: 0))
                parameter.append(":")
                stringToParse.removeRange(stringToParse.convertRange(0...key))
            default:
                key += 1
            }
        }
        StringAsArray.append(stringToParse)
        stringToParse = ""
        var ergebnis = 0
        for number in 1..<StringAsArray.count {
            if parameter[0] == "x" {
                ergebnis = StringAsArray[0].toInt()! * StringAsArray[1].toInt()!
                StringAsArray.removeAtIndex(0)
                StringAsArray[0] = "\(ergebnis)"
                parameter.removeAtIndex(0)
            }else {
                ergebnis = StringAsArray[0].toInt()! / StringAsArray[1].toInt()!
                StringAsArray.removeAtIndex(0)
                StringAsArray[0] = "\(ergebnis)"
                parameter.removeAtIndex(0)
            }
        }
        return StringAsArray[0]
}

func berechne(var stringZumBerechnen str: String) -> Int! {
    var str2 = componentsSeparatetByStrings(inString: str, separators: ["+", "-"])
    
    for (key, var value) in enumerate(str2.numbers) {
        if (value.isInString(thisChar: "x")) || (value.isInString(thisChar: ":")) {
            str2.numbers[key] = componentsSeparatetByStringsWitchCalc(inString: value, separators: ["x", ":"])
        }
    }
    
    str
    //    println(str2)
    for number in 1..<str2.numbers.count {
        var ergebnis = 0
        if str2.parameter[0] == "+" {
            ergebnis = str2.numbers[0].toInt()! + str2.numbers[1].toInt()!
            str2.numbers.removeAtIndex(0)
            str2.numbers[0] = "\(ergebnis)"
            str2.parameter.removeAtIndex(0)
            //            println(str2)
        }else {
            ergebnis = str2.numbers[0].toInt()! - str2.numbers[1].toInt()!
            str2.numbers.removeAtIndex(0)
            str2.numbers[0] = "\(ergebnis)"
            str2.parameter.removeAtIndex(0)
            //            println(str2)
        }
    }
    return str2.numbers[0].toInt()!
}

func berechnungKlammer (var inString stringToParse: String, separators separatoren: [Character])
    ->String {
        //FIXME: Klammern nach einer Klammer führt zu einem Fehler
        println("Startstring: \(stringToParse)")
        var ursprungsString = stringToParse
        var StringAsArray: [String] = []
        var place: [Int] = []
        var key = 0
        var closure = 0
        var startstring = stringToParse
        var anzahlDerKlammerAuf = 0
        var positionKlammerAuf = 0
        var startWertDerKlammern = 0
        /*
        Auflösung der Klammer
        Von Klammer auf bis Ende des Strings
        Speichern von jeder Klammer auf bis Ende in einem Array
        */
        for (var keyy, value) in enumerate(stringToParse) {
            if value == "(" && anzahlDerKlammerAuf == positionKlammerAuf {
                key
                stringToParse.removeRange(stringToParse.convertRange(0...key))
                StringAsArray.append(stringToParse)
                place.append(key)
                key = 0
                //                println("Case Sep 0 \n String: \(StringAsArray) \n key: \(place) \n ortDerKlammer: \(ortDerKlammer)")
                
            }else {
                key += 1
            }
        }
        startWertDerKlammern = place[0]
        StringAsArray
        //        println("\nNach dem 1. Switchen \n String: \(StringAsArray)\n")
        /* -->
        Nach dem 1. Switchen
        String: [4x(6+4)x2), 6+4)x2)]
        key: [4, 2]
        */
        //        println("\n")
        var positionDerKlammerZu = 0
        var anzahlDerKlammerZu = 0
        var positionDerKlammer = 0
        var StringAsArrayReverse = StringAsArray.reverse()
        for (key, stringArray) in enumerate(StringAsArrayReverse) {
            for (key2, value) in enumerate(stringArray) {
                if value == ")" && anzahlDerKlammerZu == positionDerKlammerZu {
                    //                    println(StringAsArrayReverse)
                    positionDerKlammerZu
                    key
                    StringAsArrayReverse[positionDerKlammer] = stringArray.stringByPaddingToLength(key2, withString: "", startingAtIndex: 0)
                    //                    println(StringAsArrayReverse)
                    //                    println(positionDerKlammer)
                    anzahlDerKlammerZu += 1
                    break
                } else if value == ")" {
                    positionDerKlammer += 1
                }
            }
        }
        StringAsArray = StringAsArrayReverse
        println("String nach dem Parsen: \n \(StringAsArray) \n")
        /*
        [4x2, 6x(4x2), 4x(6x(4x2)]
        ortDerKlammer:
        [4, 7, 10]
        */
        
        var zähler = 0
        var tempZwischenergebnis = ""
        var länge = 0
        for (key, value) in enumerate(StringAsArrayReverse) {
            if zähler == 0 {
                tempZwischenergebnis = "\(berechne(stringZumBerechnen: value))"
                länge = value.lenght()
                zähler += 1
            } else {
                println("Start: \(StringAsArray[zähler])")
                var ortDerKlammer = 0
                for c in value {
                    ++ortDerKlammer
                    if c == "(" {
                        break
                    }
                }
                --ortDerKlammer
                var endIndex = StringAsArray[zähler].lenght() - 1
                //FIXME: Alles Nach der Klammer wird abgeschnitten
                
                println(StringAsArray[zähler])
                StringAsArray[zähler].removeRange(StringAsArray[zähler].convertRange(ortDerKlammer...endIndex))
                println(StringAsArray[zähler])
                
                StringAsArray[zähler] = StringAsArray[zähler] + tempZwischenergebnis
                tempZwischenergebnis = String(berechne(stringZumBerechnen: StringAsArray[zähler]))
                println(StringAsArray[zähler])
                println(StringAsArray)
                zähler += 1
            }
        }
        
        
        
        
        
        /* Das berechnete Ergebnis in den Ursprungsstring einfügen*/
        ursprungsString.removeRange(ursprungsString.convertRange(startWertDerKlammern..<ursprungsString.lenght()))
        ursprungsString = ursprungsString + tempZwischenergebnis
        
        return ursprungsString
}

str = "3+2x(4x(6x(4+2))x2)"
var te = berechnungKlammer(inString: str, separators: ["(", ")"])
//berechne(stringZumBerechnen: te)
