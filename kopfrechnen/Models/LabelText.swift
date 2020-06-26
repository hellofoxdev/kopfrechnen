//
//  LabelText.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 20.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import Foundation

struct LabelText {
    var identifier: String?
    var german: String?
    var english: String?
    
    init (identifier: String, german: String, english: String) {
        self.identifier = identifier
        self.german = german
        self.english = english
    }
}

var labelTexts = [
    LabelText(identifier: "newExercises", german: "Neue Aufgaben", english: "New Exercises"),
    LabelText(identifier: "settings", german: "Einstellungen", english: "Settings"),
    LabelText(identifier: "littleOnce", german: "Das kleine 1x1", english: "The little once"),
    LabelText(identifier: "currentlySet", german: "Zur Zeit eingestellt:", english: "Currently set:"),
    LabelText(identifier: "exercisesFromTo", german: "Aufgaben von 0 bis ", english: "Exercises from 0 to"),
    LabelText(identifier: "selectOperationMain", german: "Wähle in den Einstellungen mindestens eine Operation aus!", english: "Select at least one operation from the settings menu!"),
    LabelText(identifier: "forTheGirls", german: "für Mira & Carolina", english: "for Mira & Carolina"),
    LabelText(identifier: "yourDad", german: "euer Papa", english: "your Dad"),
    LabelText(identifier: "back", german: "zurück", english: "back"),
    LabelText(identifier: "configureExercises", german: "Aufgaben", english: "Exercises"),
    LabelText(identifier: "exercise", german: "Aufgabe", english: "Exercise"),
    LabelText(identifier: "range", german: "Wertebereich: 0 -", english: "Range of values: 0 -"),
    LabelText(identifier: "selectOperation", german: "Wähle mindestens eine Operation aus!", english: "Select at least one operation!"),
    LabelText(identifier: "numberOfTasks", german: "Menge", english: "Quantity"),
    LabelText(identifier: "arithmeticOperations", german: "Rechenoperationen", english: "Arithmetic operations"),
    LabelText(identifier: "skip", german: "Überspringen", english: "Skip"),
    LabelText(identifier: "skipped", german: "Übersprungen", english: "Skipped"),
    LabelText(identifier: "cancel", german: "Abbrechen", english: "Cancel"),
    LabelText(identifier: "check", german: "Prüfen", english: "Check"),
    LabelText(identifier: "exerciseNumber", german: "Aufgabe Nummer: ", english: "Exercise #"),
    LabelText(identifier: "lastResult", german: "Dein letztes Ergebnins war:", english: "Your last result:"),
    LabelText(identifier: "lastResults", german: "Deine Ergebninsse", english: "Your results"),
    LabelText(identifier: "canceled", german: "Abgebrochen", english: "Canceled"),
    LabelText(identifier: "correct", german: "Richtig", english: "Correct"),
    LabelText(identifier: "wrong", german: "Falsch", english: "Wrong"),
    LabelText(identifier: "calculated", german: "Gerechnet:", english: "Calculated:"),
    LabelText(identifier: "sameSettings", german: "mit gleichen Einstellungen", english: "with the same settings"),
    LabelText(identifier: "design", german: "Design", english: "Design"),
    LabelText(identifier: "iloveyou", german: "Ich habe euch ganz doll lieb!", english: "I love you very much!"),
    LabelText(identifier: "notCalced", german: "Nicht gerechnet", english: "not calculated"),
    LabelText(identifier: "versionHistory", german: "Version", english: "Version"),
    LabelText(identifier: "licences", german: "Lizenzen", english: "Licences"),
    LabelText(identifier: "version_1_init", german: "* Veröffentlicheung der App", english: "* Release of App"),
    LabelText(identifier: "version_1.1_newDesign", german: "* Neue Designs: Tafel, Papier und einfach weiß", english: "* New Designs: Blackboard, Paper and plain white"),
    LabelText(identifier: "version_1.1_littleOnce", german: "* Anzeige des kleinen 1x1", english: "* Introduction of the little once"),
    LabelText(identifier: "version_1.1_minorBugFix", german: "* Behebung kleinerer Fehler", english: "* Minor bug fixing"),
    LabelText(identifier: "version_1.1_addEnglish", german: "* Englische Texte sind jetzt verfügbar", english: "* English texts are now available"),
    LabelText(identifier: "licenceSQLite", german: "SQLite.swift von Stephen Celis", english: "SQLite.swift by Stephen Celis"),
    LabelText(identifier: "licenceTextSQLite", german: "MIT License \n\nCopyright (c) 2014-2015 Stephen Celis (stephen@stephencelis.com)\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. \n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOTLIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.", english: "MIT License \n\nCopyright (c) 2014-2015 Stephen Celis (stephen@stephencelis.com)\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. \n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOTLIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."),
    
    LabelText(identifier: "licenceFontCoconutPunch", german: "Schriftart: Coconut Punch", english: "Font: Coconut Punch"),
    LabelText(identifier: "licenceTextFontCoconutPunch", german: "Application EULA 1.7.2 - By Monthly Active User", english: "Application EULA 1.7.2 - By Monthly Active User"),
    LabelText(identifier: "chooseDesign", german: "Wähle zunächst Design", english: "First, choose your design"),
    LabelText(identifier: "changeDesign", german: "Keine Angst, du kannst es später unter EINSTELLUNGEN jederzeit ändern.", english: "No wories, you can change it any time under SETTINGS."),
    LabelText(identifier: "letsGo", german: "Los geht's!", english: "Let's go!"),
    LabelText(identifier: "customizeExercises", german: "Stelle hier die Anzahl und Art von Aufgaben ein", english: "Setup the quantity and type of your exercises"),
    LabelText(identifier: "customizeDesign", german: "Wähle hier dein Design aus", english: "Choose your design"),
    LabelText(identifier: "chalkboard", german: "Kreidetafel", english: "Chalk board"),
    LabelText(identifier: "quadPaper", german: "Kariertes Papier", english: "Quad paper"),
    LabelText(identifier: "plainWhite", german: "Einfach weiß", english: "Plain white"),
    LabelText(identifier: "plus", german: "Plus / Addition", english: "Addition"),
    LabelText(identifier: "minus", german: "Minus / Subtraktion", english: "Subtraction"),
    LabelText(identifier: "multiply", german: "Mal / Multiplikation", english: "Multiply"),
    LabelText(identifier: "divide", german: "Geteilt / Division", english: "Divide"),
    LabelText(identifier: "1+1", german: "1+1=?", english: "1+1=?"),
    LabelText(identifier: "Mira", german: "Mira", english: "Mira"),
    LabelText(identifier: "Caro", german: "Caro", english: "Caro"),
]
