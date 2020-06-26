//
//  HelperFunctions.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 01.06.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import Foundation
import SwiftUI

func getIntValue(value: Double = 0) -> Int {
        return Int(value)
}

// Initialisierung der Aufgaben durch gegebene Parameter
func initTasks(search: SearchData, userData: UserData) {
    
    userData.calcTasks.removeAll()
    for index in 1...search.numberOfTasks {
        let randomOperatorIndex = Int.random(in: 0 ..< search.selectedOperations.count)
        let randomOperator = search.selectedOperations[randomOperatorIndex]
        
        var randomOperatorX: Int?
        var randomOperatorY: Int?
        
        switch randomOperator {
        case .plus:
            let intMinOperatorValue = getIntValue(value: search.minOperatorValue)
            let intMaxOperatorValue = getIntValue(value: search.maxOperatorValue)
            
//                First Operator
            randomOperatorX = Int.random(in: 0 ..< intMaxOperatorValue - 1)
//                Second Operator
            randomOperatorY = Int.random(in: intMinOperatorValue ..< intMaxOperatorValue - randomOperatorX!)

        case .minus:
            let intMinOperatorValue = getIntValue(value: search.minOperatorValue)
            let intMaxOperatorValue = getIntValue(value: search.maxOperatorValue)
            
//                First Operator
            randomOperatorX = Int.random(in: intMinOperatorValue ..< intMaxOperatorValue)
//                Second Operator
            randomOperatorY = Int.random(in: 0 ..< randomOperatorX!)

        case .multiply:
            let intMinOperatorValue = getIntValue(value: search.minOperatorValue)
            let intMaxOperatorValue = getIntValue(value: search.maxOperatorValue)
            
//                First Operator
            randomOperatorX = Int.random(in: intMinOperatorValue ..< (intMaxOperatorValue / 4)+1 )
//                Second Operator
            randomOperatorY = Int.random(in: intMinOperatorValue ..< max(intMinOperatorValue+1, intMaxOperatorValue / max(randomOperatorX!, 1)))

        case .divide:
            let intMinOperatorValue = getIntValue(value: search.minOperatorValue)
            let intMaxOperatorValue = getIntValue(value: search.maxOperatorValue)
            
//                First Operator
            randomOperatorX = Int.random(in: max(0, intMinOperatorValue) ..< (intMaxOperatorValue / 4)+1 )
//                Second Operator
            randomOperatorY = Int.random(in: intMinOperatorValue ..< max(intMinOperatorValue+1, intMaxOperatorValue / max(randomOperatorX!, 1)))
            
            let result = randomOperatorX! * randomOperatorY!
            randomOperatorY = randomOperatorX
            randomOperatorX = result

        }
        
        if (randomOperatorX != nil && randomOperatorY != nil) {
            let task: Task = Task(index: index, operatorType: randomOperator, operatorX: randomOperatorX!, operatorY: randomOperatorY!)
            userData.calcTasks.append(task)
        }
        userData.pageIndex = .calc
        closeMenu(search: search, userData: userData)
    }
}

func openMenu(userData: UserData) {
    userData.showMenu = true
    userData.menuOffsetY = CGFloat (0)
    userData.menuOffsetX = CGFloat (0)
    userData.isButtonDisabled = false
}

func closeMenu(search: SearchData, userData: UserData) {
    userData.menuOffsetY = CGFloat (UIScreen.main.bounds.height)
    userData.menuOffsetX = -UIScreen.main.bounds.width
    userData.isButtonDisabled = true
//    saveSettings(search: search)
    userData.showMenu = false
}

func openLittleOnce(userData: UserData) {
    userData.showLittleOnce = true
    userData.littleOnceOffsetY = CGFloat (0)
    userData.littleOnceOffsetX = CGFloat (0)
}

func closeLittleOnce(userData: UserData) {
    userData.showLittleOnce = false
    userData.littleOnceOffsetY = CGFloat (UIScreen.main.bounds.height)
    userData.littleOnceOffsetX = CGFloat (-UIScreen.main.bounds.height)
}

func openVersionView(userData: UserData) {
    userData.showVersion = true
    userData.versionOffsetY = CGFloat (0)
    userData.versionOffsetX = CGFloat (0)
}

func closeVersionView(userData: UserData) {
    userData.showVersion = false
    userData.versionOffsetY = CGFloat (UIScreen.main.bounds.height)
    userData.versionOffsetX = CGFloat (-UIScreen.main.bounds.height)
}

func openGirlsView(userData: UserData) {
    userData.showGirls = true
    userData.girlsOffsetY = CGFloat (0)
    userData.girlsOffsetX = CGFloat (0)
}

func closeGirlsView(userData: UserData) {
    userData.showGirls = false
    userData.girlsOffsetY = CGFloat (UIScreen.main.bounds.height)
    userData.girlsOffsetX = CGFloat (-UIScreen.main.bounds.height)
}
