
func ArrayWertAusgabe<T>(vonWelchemArray ausgewähltesArray: [T], index: Int) ->T? {
    var ergebnis: T?
    for (key, value) in enumerate(ausgewähltesArray) {
        if key == index {
            ergebnis = value
        }
    }
    return ergebnis
}

var autoren = ["Ralf", "Stefan", "Peter", "Jürgen"]
var autoren1 = [1, 2, 3, 4]


ArrayWertAusgabe(vonWelchemArray: autoren1, 2)




extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
println("One inch is \(oneInch) meters")
// prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
println("Three feet is \(threeFeet) meters")
// prints "Three feet is 0.914399970739201 meters"




extension Array {
    func ArrayWertAusgabe<T>(vonWelchemArray ausgewähltesArray: [T], index: Int) ->T? {
        var ergebnis: T?
        for (key, value) in enumerate(ausgewähltesArray) {
            if key == index {
                ergebnis = value
            }
        }
        return ergebnis
    }
    
    var ausgabeEinesValues: T? {
        var ergebnis: T?
        for (key, value) in enumerate(self) {
            if key == key {
                ergebnis = value
            }
        }
        return ergebnis

    }
    
    // Ausgabe der eingabe
    var versuch: Array {return self}
    
}

autoren.ArrayWertAusgabe(vonWelchemArray: autoren, index: 1)
autoren.ausgabeEinesValues









