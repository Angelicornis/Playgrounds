// Playground - noun: a place where people can play

import Cocoa

protocol WortParserDelegate {
    func didFoundWort(wort: String) -> Void
}

class WortParser {
    let stringToParse: String
    var delegate: WortParserDelegate?
    
    init(stringToParse: String) {
        self.stringToParse = stringToParse
    }
    
    func parse() {
        let arrayOfWords = stringToParse.componentsSeparatedByString("+")
        for wort in arrayOfWords {
            delegate!.didFoundWort(wort)
        }
    }
}


class Me: WortParserDelegate {
    func start() {
        let parser = WortParser(stringToParse: "567+567+667*2")
        parser.delegate = self
        parser.parse()
    }
    
     func didFoundWort(wort: String) {
        println(wort)
    }
}

let instanz = Me()
instanz.start()


