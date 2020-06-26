//
//  SceneDelegate.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 07.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import UIKit
import SwiftUI
import SQLite

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var settings = UserData()
    
    // Current Version -> a version jump causes a re-initialisation of labeltexts
    let currentVerison: Float = 1.1

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            // Load current installed version
            let version = defaults.float(forKey: "version")
            if version != 0.0 {
                settings.appVersion = version
            }
            
            // Init of SQLite Database
//            self.initDb()
//            createLblTxts()
            
//            // Load saved excercise parameter
//            let maxOperatorValue = defaults.double(forKey: "maxOperatorValue")
//            if maxOperatorValue != 0 {
//                settings.maxOperatorValue = maxOperatorValue
//            }
//
//            let numberOfTasks = defaults.integer(forKey: "numerOfTasks")
//            if numberOfTasks == 0 {
//                numberOfTasks = 12
//                settings.numberOfTasks = numberOfTasks
//
//            }
//            let string = defaults.string(forKey: "selectedOperations")
//            if string != nil {
//                let data = string!.data(using: .utf8)!
//                do {
//                    let result = try JSONDecoder().decode([OperatorType].self, from: data)
//                    for item in result {
//                        settings.selectedOperations.append(item)
//                    }
//                } catch {
//                    print("Something went wrong!")
//                }
//            }
            
            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(settings))
            
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
//    func initDb() {
//
//        let path = NSSearchPathForDirectoriesInDomains(
//            .documentDirectory, .userDomainMask, true
//        ).first!
//
//
//        do {
//
//            let db = try Connection("\(path)/kopfrechnen.sqlite3")
//
//            let results = Table("results")
//            let labelTexts = Table("labelTexts")
//
//            // Results
//
//            let id = Expression<Int64>("id")
//            let email = Expression<String>("email")
//            let name = Expression<String?>("name")
//
//            try db.run(results.create(ifNotExists: true) { t in     // CREATE TABLE "users" (
//                t.column(id, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
//                t.column(email, unique: true)  //     "email" TEXT UNIQUE NOT NULL,
//                t.column(name)                 //     "name" TEXT
//            })
//
////            try db.run(results.delete())
//
//            // Texts
//
//            let indicator = Expression<String?>("indicator")
//            let germanText = Expression<String?>("germanText")
//            let englishText = Expression<String?>("englishText")
//
//            try db.run(labelTexts.create(ifNotExists: true) { t in     // CREATE TABLE "users" (
//                t.column(id, primaryKey: true) //     "id" INTEGER PRIMARY KEY NOT NULL,
//                t.column(indicator, unique: true)  //     "email" TEXT UNIQUE NOT NULL,
//                t.column(germanText)                 //     "name" TEXT
//                t.column(englishText)                 //     "name" TEXT
//            })
//
////
////            let count = try db.scalar(results.count)
////            print(count)
//
//        } catch {
//            print("someting went wrong")
//        }
//
//    }

//    func createLblTxts() {
//        let path = NSSearchPathForDirectoriesInDomains(
//            .documentDirectory, .userDomainMask, true
//        ).first!
//
//
//        do {
//            let labelTexts = Table("labelTexts")
//            let db = try Connection("\(path)/kopfrechnen.sqlite3")
//
//            try db.run(labelTexts.delete())
//
//            let indicator = Expression<String?>("indicator")
//            let germanText = Expression<String?>("germanText")
//            let englishText = Expression<String?>("englishText")
//
//
//            do {
//                try db.run(labelTexts.insert(indicator <- "newExercises", germanText <- "Neue Aufgaben", englishText <- "New Exercises"))
//                try db.run(labelTexts.insert(indicator <- "settings", germanText <- "Einstellungen", englishText <- "Settings"))
//                try db.run(labelTexts.insert(indicator <- "littleOnce", germanText <- "Das kleine 1x1", englishText <- "The little once"))
//                try db.run(labelTexts.insert(indicator <- "currentlySet", germanText <- "Zur Zeit eingestellt:", englishText <- "Currently set:"))
//                try db.run(labelTexts.insert(indicator <- "exercisesFromTo", germanText <- "Aufgaben von 0 bis ", englishText <- "Exercises from 0 to"))
//                try db.run(labelTexts.insert(indicator <- "selectOperationMain", germanText <- "Wähle in den Einstellungen mindestens eine Operation aus!", englishText <- "Select at least one operation from the settings menu!"))
//                try db.run(labelTexts.insert(indicator <- "forTheGirls", germanText <- "für Mira & Carolina", englishText <- "for Mira & Carolina"))
//                try db.run(labelTexts.insert(indicator <- "yourDad", germanText <- "euer Papa", englishText <- "your Dad"))
//                try db.run(labelTexts.insert(indicator <- "back", germanText <- "zurück", englishText <- "back"))
//                try db.run(labelTexts.insert(indicator <- "configureExercises", germanText <- "Konfiguriere deine Aufgaben", englishText <- "Configure your exercises"))
//                try db.run(labelTexts.insert(indicator <- "range", germanText <- "Wertebereich: 0 -", englishText <- "Range of values: 0 -"))
//                try db.run(labelTexts.insert(indicator <- "selectOperation", germanText <- "Wähle mindestens eine Operation aus!", englishText <- "Select at least one operation!"))
//                try db.run(labelTexts.insert(indicator <- "numberOfTasks", germanText <- "Menge", englishText <- "Quantity"))
//                try db.run(labelTexts.insert(indicator <- "arithmeticOperations", germanText <- "Rechenoperationen", englishText <- "Arithmetic operations"))
//                try db.run(labelTexts.insert(indicator <- "skip", germanText <- "Überspringen", englishText <- "Skip"))
//                try db.run(labelTexts.insert(indicator <- "skipped", germanText <- "Übersprungen", englishText <- "Skipped"))
//                try db.run(labelTexts.insert(indicator <- "cancel", germanText <- "Abbrechen", englishText <- "Cancel"))
//                try db.run(labelTexts.insert(indicator <- "check", germanText <- "Prüfen", englishText <- "Check"))
//                try db.run(labelTexts.insert(indicator <- "exerciseNumber", germanText <- "Aufgabe Nummer: ", englishText <- "Exercise #"))
//                try db.run(labelTexts.insert(indicator <- "lastResult", germanText <- "Dein letztes Ergebnins war:", englishText <- "Your last result:"))
//                try db.run(labelTexts.insert(indicator <- "lastResults", germanText <- "Die letzten Ergebninsse", englishText <- "Your last results:"))
//                try db.run(labelTexts.insert(indicator <- "canceled", germanText <- "Abgebrochen", englishText <- "Canceled"))
//                try db.run(labelTexts.insert(indicator <- "correct", germanText <- "Richtig", englishText <- "Correct"))
//                try db.run(labelTexts.insert(indicator <- "wrong", germanText <- "Falsch", englishText <- "Wrong"))
//                try db.run(labelTexts.insert(indicator <- "calculated", germanText <- "Gerechnet:", englishText <- "Calculated:"))
//                try db.run(labelTexts.insert(indicator <- "sameSettings", germanText <- "mit gleichen Einstellungen", englishText <- "with the same settings"))
//
//
//            } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
//                print("constraint failed: \(message), in \(String(describing: statement))")
//            } catch let error {
//                print("insertion failed: \(error)")
//            }
//
//        } catch {
//            print("something went wrong")
//        }
//    }
}

//func lblTxt(id: String) -> String {
//    let langStr = Locale.current.languageCode
//
//    let path = NSSearchPathForDirectoriesInDomains(
//        .documentDirectory, .userDomainMask, true
//    ).first!
//
//    var value: String = "label not found"
//
//    do {
//        let labelTexts = Table("labelTexts")
//        let db = try Connection("\(path)/kopfrechnen.sqlite3")
//
//        let indicator = Expression<String?>("indicator")
//        let germanText = Expression<String?>("germanText")
//        let englishText = Expression<String?>("englishText")
//
////        for labelText in try db.prepare(labelTexts.filter(indicator == id)) {
////            value = try labelText.get(englishText)!
////        }
//        let labelText = try db.pluck(labelTexts.filter(indicator == id))
//        if labelText != nil {
//            if langStr == "de" {
//                value = try labelText!.get(germanText)!
//            } else {
//                value = try labelText!.get(englishText)!
//            }
//        }
//
//    } catch {
//        print("something went wrong")
//    }
//
//    return value
//}
