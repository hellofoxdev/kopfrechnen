//
//  SearchData.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 25.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI
import Combine

class SearchData: ObservableObject {
//    @Published var selectedOperations: [Op
    @Published var minOperatorValue: Double = 1
    
    
    @Published var numberOfTasks: Int = UserDefaults.standard.integer(forKey: "numberOfTasks") {
        didSet {
            UserDefaults.standard.set(self.numberOfTasks, forKey: "numberOfTasks")
        }
    }
    
    @Published var maxOperatorValue: Double = UserDefaults.standard.double(forKey: "maxOperatorValue") {
        didSet {
            UserDefaults.standard.set(self.maxOperatorValue, forKey: "maxOperatorValue")
        }
    }
    
    @Published var selectedOperations: [OperatorType] = [] {
        didSet {
            self.saveOperations()
        }
    }
    
    init() {
        if self.numberOfTasks == 0 {
            self.numberOfTasks = 10
        }
        if self.minOperatorValue == 0 {
            self.minOperatorValue = 1
        }
        if self.maxOperatorValue == 0 {
            self.maxOperatorValue = 20
        }
        
        loadOperations()
    }
    
    func saveOperations() {
        do {
            let data = try JSONEncoder().encode(self.selectedOperations)
            let string = String(data: data, encoding: .utf8)!
            UserDefaults.standard.set(string, forKey: "selectedOperations")
        } catch {
            print("Something went wrong")
        }
    }
    
    func loadOperations() {
        let string = defaults.string(forKey: "selectedOperations")
        if string != nil {
            let data = string!.data(using: .utf8)!
            do {
                let result = try JSONDecoder().decode([OperatorType].self, from: data)
                for item in result {
                    self.selectedOperations.append(item)
                
                }
            } catch {
                print("Something went wrong!")
            }
        }
    }
}
