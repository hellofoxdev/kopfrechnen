//
//  CalcView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 09.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

let defaults = UserDefaults.standard
let offsetExpanded = CGFloat(0)
let offsetCollapsed = UIScreen.main.bounds.height

struct CalcView: View {
    @EnvironmentObject var userData: UserData
    
    @ObservedObject var search = SearchData()
    @ObservedObject var lblTxtStore = LabelTextStore()
    
    @State private var calcMenuOffset = CGFloat(0)
    @State private var finishedMenuOffset = UIScreen.main.bounds.height
    
    
    let rows: Int = 3
    let columns: Int = 3
    let padSize: CGFloat = UIScreen.main.bounds.width/2
    
    let dh: DesignHandler = DesignHandler()
    
//    @Binding var menuOffsetX: CGFloat
//    @Binding var calcTasks: [Task]
//    @Binding var showMenu: Bool    

    var pendingTasks: [Task] {
        userData.calcTasks.filter { $0.isPending }
    }
    
    var calculatedTasks: [Task] {
        userData.calcTasks.filter { $0.isCorrect || $0.isIncorrect || $0.isSkipped || $0.isCanceled}
    }
    
    var correctTasks: [Task] {
        userData.calcTasks.filter { $0.isCorrect }
    }
    
    var incorrectTasks: [Task] {
        userData.calcTasks.filter { $0.isIncorrect }
    }
    
    var skippedTasks: [Task] {
        userData.calcTasks.filter { $0.isSkipped }
    }
    
    var cancelledTasks: [Task] {
        userData.calcTasks.filter { $0.isCanceled }
    }
    
    @State var enteredResult: String = ""
    
    func getIntValue(value: String) -> Int {
        if value != "" {
            return Int(value)!
        }
        return 0
    }
    
    func getOperatorSign(operatorType: OperatorType) -> String {
        
        switch operatorType {
            case .plus:
                return "+"
            case .minus:
                return "-"
            case .multiply:
                return "x"
            case .divide:
                return ":"
            }
    }
    
    func getCurrentTaskNumber() -> Int {
        let index = userData.calcTasks.firstIndex(of: pendingTasks[0])
        return index! + 1
    }
    
    func getSpecificTaskNumber(task: Task) -> Int {
        let index = userData.calcTasks.firstIndex(of: task)
        return index! + 1
    }
    
    func returnLastCalculatedTask() -> Task {
        return calculatedTasks.last!
    }
    
    func addNumberToString(number: String) {
        enteredResult.append(number)
    }
    
    func removeNumberFromString() {
        let x = enteredResult.dropLast()
        enteredResult = String(x)
//        print(x)
    }
    
    var body: some View {
        ZStack() {
            if userData.design == "blackboard" {
                Image("blackboard")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width)
            } else if userData.design == "paper" {
                Image("paper")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width)
            }
//        VStack() {
            VStack() {
                if pendingTasks.count != 0 {

                    ScrollView([]) {
//                    VStack() {
//                        Text("\(lblTxtStore.getTxt(id: "exerciseNumber"))\(getCurrentTaskNumber())")
//                            .font(dh.getFontHeadline(design: userData.design))
//                            .fontWeight(.light)
//                            .fixedSize(horizontal: true, vertical: true)
//                            .lineLimit(1)
//                            .padding()
//                            .foreground(dh.getNightCherryGradient(design: userData.design))
                        Spacer()
                        HStack(alignment: .center) {
                            Spacer()
                            Text("\(pendingTasks[0].operatorX!) \(self.getOperatorSign(operatorType: pendingTasks[0].operatorType)) \(pendingTasks[0].operatorY!) = ")
                                .font(dh.getFontExercise(design: userData.design))
//                                .foregroundColor(dh.getFontColor(design: userData.design))
                                .foreground(dh.getBlackGradient(design: userData.design))
//                                .fontWeight(.light)
                                .fixedSize(horizontal: true, vertical: true)
                                .lineLimit(1)
//                                .padding(.vertical)
                                                    
                            TextField("???", text: $enteredResult)
                                .font(dh.getFontExercise(design: userData.design))
                                    .multilineTextAlignment(.center)
//                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100, height: 30)
                                .disabled(true)
                                .padding(.bottom, 10)
                                .offset(y: 5)
                                
                            Spacer()
                        }
                        .padding(.top, 20)
                        Spacer()

                        HStack() {
                            VStack() {

                                HStack() {
                                    // Button 1
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.addNumberToString(number: "1")
                                        }
                                    }) {
                                        Text("1")
                                        .font(dh.getFontPadButtons(design: userData.design))
//                                            .font(self.dh.getFontText(design: self.userData.design))
                                            .foreground(dh.getBlackGradient(design: userData.design))
//                                            .padding()
//                                            .foregroundColor(.black)
                                    }
                                    .frame(width: padSize/3)
                                    .padding()
                                    
                                    // Button 2
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.addNumberToString(number: "2")
                                        }
                                    }) {
                                        Text("2")
                                            .font(dh.getFontPadButtons(design: userData.design))
                                             .foreground(dh.getBlackGradient(design: userData.design))
//                                             .padding()

                                    }
                                    .frame(width: padSize/3)
                                    .padding()
                                    
                                    // Button 3
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.addNumberToString(number: "3")
                                        }
                                    }) {
                                        Text("3")
                                            .font(self.dh.getFontPadButtons(design: self.userData.design))
                                            .foreground(dh.getBlackGradient(design: userData.design))
//                                            .padding()
//                                            .foregroundColor(.black)
                                    }
                                    .frame(width: padSize/3)
                                    .padding()
                                }
                                .frame(width: padSize)
                                

                                HStack() {
                                    // Button 4
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.addNumberToString(number: "4")
                                        }
                                    }) {
                                        Text("4")
                                            .font(self.dh.getFontPadButtons(design: self.userData.design))
                                            .foreground(dh.getBlackGradient(design: userData.design))
//                                            .padding()
//                                            .foregroundColor(.black)
                                    }
                                    .frame(width: padSize/3)
                                    .padding()
                                    
                                    // Button 5
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.addNumberToString(number: "5")
                                        }
                                    }) {
                                        Text("5")
                                            .font(self.dh.getFontPadButtons(design: self.userData.design))
                                            .foreground(dh.getBlackGradient(design: userData.design))
//                                            .padding()
//                                            .foregroundColor(.black)
                                    }
                                    .frame(width: padSize/3)
                                    .padding()
                                    
                                    // Button 6
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.addNumberToString(number: "6")
                                        }
                                    }) {
                                        Text("6")
                                            .font(self.dh.getFontPadButtons(design: self.userData.design))
                                            .foreground(dh.getBlackGradient(design: userData.design))
//                                            .padding()
//                                            .foregroundColor(.black)
                                    }
                                    .frame(width: padSize/3)
                                    .padding()
                                }
                                .frame(width: padSize)
                                
                                HStack() {
                                // Button 7
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                        self.addNumberToString(number: "7")
                                    }
                                }) {
                                    Text("7")
                                        .font(self.dh.getFontPadButtons(design: self.userData.design))
                                        .foreground(dh.getBlackGradient(design: userData.design))
//                                        .padding(10)
//                                            .foregroundColor(.black)
                                }
                                .frame(width: padSize/3)
                                .padding()
                                
                                // Button 8
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                        self.addNumberToString(number: "8")
                                    }
                                }) {
                                    Text("8")
                                        .font(self.dh.getFontPadButtons(design: self.userData.design))
                                        .foreground(dh.getBlackGradient(design: userData.design))
//                                        .padding(10)
                                        
//                                            .foregroundColor(.black)
                                }
                                .frame(width: padSize/3)
                                .padding()
                                    
                                // Button 9
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                        self.addNumberToString(number: "9")
                                    }
                                }) {
                                    Text("9")
                                        .font(self.dh.getFontPadButtons(design: self.userData.design))
                                        .foreground(dh.getBlackGradient(design: userData.design))
//                                        .padding()
//                                            .foregroundColor(.black)
                                }
                                .frame(width: padSize/3)
                                .padding()
                            }
                            .frame(width: padSize)
                                

                                HStack() {
                                        
                                        // Button ,
                                        Button(action: {
                                            withAnimation(.linear(duration: 0.2)) {
                                                self.addNumberToString(number: " ")
                                            }
                                        }) {
                                            Text(" ")
                                                .font(self.dh.getFontPadButtons(design: self.userData.design))
                                                .foreground(dh.getNightCherryGradient(design: userData.design))
//                                                .padding()
                                        }
                                    .disabled(true)
                                        .frame(width: padSize/3)
                                        .padding()
                                    
                                    // Button 0
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.addNumberToString(number: "0")
                                        }
                                    }) {
                                        Text("0")
                                            .font(self.dh.getFontPadButtons(design: self.userData.design))
                                            .foreground(dh.getBlackGradient(design: userData.design))
//                                            .padding()
//                                            .foregroundColor(.black)
                                    }
//                                    .disabled(true)
                                    .frame(width: padSize/3)
                                    .padding()
                                    
                                    // Button <
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.removeNumberFromString()
                                        }
                                    }) {
                                        Text("<")
                                            .font(self.dh.getFontPadButtons(design: self.userData.design))
                                            .foreground(dh.getCherryPinkGradient(design: userData.design))
//                                            .padding()
                                    }
                                    .frame(width: padSize/3)
                                    .padding()
                                }
                                .frame(width: padSize)
                                .padding(.horizontal, 20)
                            }
                            .shadow(radius: 2, y: 1)
                        }
//                        Spacer()
                        Rectangle().fill(Color .clear)
                            .frame(height: 110)
                    }
            
                } else {
                    Spacer()
                    Text(lblTxtStore.getTxt(id: "lastResults"))
                    .font(dh.getFontText(design: userData.design))
                        .fontWeight(.light)
                        .fixedSize(horizontal: true, vertical: true)
                        .lineLimit(1)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                        .foreground(dh.getCherryPinkGradient(design: userData.design))
                        .padding(.top, 50)
                    
                    Text("\(lblTxtStore.getTxt(id: "correct")) \(correctTasks.count) \(lblTxtStore.getTxt(id: "wrong")): \(incorrectTasks.count) \(lblTxtStore.getTxt(id: "notCalced")): \(cancelledTasks.count + skippedTasks.count)")
//                        .font(.avenirNextRegular(size: 12))
                        .font(dh.getFontResultList(design: userData.design))
                        .fontWeight(.light)
//                        .foregroundColor(dh.getFontColor(design: userData.design))
                        .foreground(dh.getBlackGradient(design: userData.design))
                        .fixedSize(horizontal: true, vertical: true)
                        .lineLimit(1)
                        .padding(.bottom, 15)
                        .padding(.horizontal)
                    
                    ScrollView(.vertical) {
//                        VStack() {
                        ForEach(calculatedTasks, id: \.self) { task in

                            HStack() {
                                Text("\(self.getSpecificTaskNumber(task: task)):").frame(width: 25)
                                    .font(self.dh.getFontResultList(design: self.userData.design))
                                    .foreground(self.dh.getBlackGradient(design: self.userData.design))
//                                    .foregroundColor(self.dh.getFontColor(design: self.userData.design))
                                
                                Text("\(task.operatorX!) \((self.getOperatorSign(operatorType: task.operatorType))) \(task.operatorY!) = \(task.calculatedResult!)").frame(width: 110)
                                    .font(self.dh.getFontResultList(design: self.userData.design))
                                    .foreground(self.dh.getBlackGradient(design: self.userData.design))
//                                    .foregroundColor(self.dh.getFontColor(design: self.userData.design))
                                
                                Text("\(task.enteredResult != nil ? "\(self.lblTxtStore.getTxt(id: "calculated")) \(String(task.enteredResult!))" : task.isSkipped ? self.lblTxtStore.getTxt(id: "skipped") : self.lblTxtStore.getTxt(id: "canceled"))").frame(width: 135)
                                    .font(self.dh.getFontResultList(design: self.userData.design))
                                .foreground(self.dh.getBlackGradient(design: self.userData.design))
                                
                                .foreground(task.isCorrect ? self.userData.design == "blackboard" ? gradientLimeAndCandy : gradientCandyAndGreen : task.isIncorrect ? gradientPeachAndRedPeach : task.isSkipped ? gradientSeaAndBlue : self.dh.getBlackGradient(design: self.userData.design))
//                                    .foregroundColor(self.dh.getFontColor(design: self.userData.design))
                            }
//                            .foregroundColor(task.isCorrect ? Color ("Candy") : task.isIncorrect ? Color ("RedPeach") : task.isSkipped ? Color ("Sea") : self.userData.design == "blackboard" ? .white : Color ("Night"))
                            
//
//                                .foreground(task.isCorrect ? self.userData.design == "blackboard" ? gradientLimeAndCandy : gradientCandyAndGreen : task.isIncorrect ? gradientPeachAndRedPeach : task.isSkipped ? gradientSeaAndBlue : self.dh.getBlackGradient(design: self.userData.design))
                        }
                    }
                    Spacer()
                    
                    Rectangle().fill(Color .clear)
                        .frame(height: 160)
                }
            }

//                .edgesIgnoringSafeArea(.all)
//            .padding(.top, 30)
                    
//        }
            CalcMenu(
                enteredResult: $enteredResult,
                calcMenuOffset: $calcMenuOffset,
                finishedMenuOffset: $finishedMenuOffset
            )
                .offset(y: calcMenuOffset)
            
            FinishedMenu(
                enteredResult: $enteredResult,
                calcMenuOffset: $calcMenuOffset,
                finishedMenuOffset: $finishedMenuOffset
            )
                .offset(y: finishedMenuOffset)
        }
        .background(Color .white)
        .animation(.spring())
        .edgesIgnoringSafeArea(.all)
    }
}

func saveSettings(search: SearchData) {
    defaults.set(search.maxOperatorValue, forKey: "maxOperatorValue")
    defaults.set(search.numberOfTasks, forKey: "numerOfTasks")
    

    do {
        let data = try JSONEncoder().encode(search.selectedOperations)
        let string = String(data: data, encoding: .utf8)!
        defaults.set(string, forKey: "selectedOperations")
    } catch {
        print("Something went wrong")
    }
}

struct FinishedMenu: View {
    @EnvironmentObject var userData: UserData
    //@ObservedObject var search = SearchData()
    //@State var navBarHidden: Bool = true
    @ObservedObject var lblTxtStore = LabelTextStore()

    @ObservedObject var search = SearchData()
    @Binding var enteredResult: String
    @Binding var calcMenuOffset: CGFloat
    @Binding var finishedMenuOffset: CGFloat


    var pendingTasks: [Task] {
        userData.calcTasks.filter { $0.isPending }
    }

    var calculatedTasks: [Task] {
        userData.calcTasks.filter { $0.isCorrect || $0.isIncorrect || $0.isSkipped || $0.isCanceled}
    }

    var correctTasks: [Task] {
        userData.calcTasks.filter { $0.isCorrect }
    }

    var incorrectTasks: [Task] {
        userData.calcTasks.filter { $0.isIncorrect }
    }

    var skippedTasks: [Task] {
        userData.calcTasks.filter { $0.isSkipped }
    }

    var cancelledTasks: [Task] {
        userData.calcTasks.filter { $0.isCanceled }
    }

    let dh: DesignHandler = DesignHandler()



    func getIntValue(value: String) -> Int {
        if value != "" {
            return Int(value)!
        }
        return 0
    }

    func calc() {
        let indexOfCalcTask = userData.calcTasks.firstIndex(of: pendingTasks[0])
        if getIntValue(value: enteredResult) == pendingTasks[0].calculatedResult {
            userData.calcTasks[indexOfCalcTask!].enteredResult = getIntValue(value: enteredResult)
            userData.calcTasks[indexOfCalcTask!].isPending = false
            userData.calcTasks[indexOfCalcTask!].isCorrect = true
            userData.calcTasks[indexOfCalcTask!].isIncorrect = false
            enteredResult = ""
        } else {
            userData.calcTasks[indexOfCalcTask!].enteredResult = getIntValue(value: enteredResult)
            userData.calcTasks[indexOfCalcTask!].isPending = false
            userData.calcTasks[indexOfCalcTask!].isCorrect = false
            userData.calcTasks[indexOfCalcTask!].isIncorrect = true
            userData.calcTasks[indexOfCalcTask!].calcStatus = .incorrect
            enteredResult = ""
        }
        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }
    }


    func cancelCalc() {
        for task in pendingTasks {
            let index = userData.calcTasks.firstIndex(of: task)!
            userData.calcTasks[index].calcStatus = .canceled
            userData.calcTasks[index].isPending = false
            userData.calcTasks[index].isCanceled = true
            enteredResult = ""

        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }
        }
    }

    func skipCalc() {
        let index = userData.calcTasks.firstIndex(of: pendingTasks.first!)!
            userData.calcTasks[index].calcStatus = .skipped
            userData.calcTasks[index].isPending = false
            userData.calcTasks[index].isSkipped = true
            enteredResult = ""

        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }
    }

    func calcAgain() {
        initTasks(search: self.search, userData: self.userData)


        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }
    }

    func backToMain() {
        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }

        userData.pageIndex = .main
    }

    var body: some View {
        VStack() {
            Spacer()
            HStack() {
                Spacer()
                VStack() {
                    // Neue Aufgaben
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            self.calcAgain()
                        }
                    }) {

                        VStack() {
                            HStack(){
                                Image(systemName: "repeat")
                                Text(lblTxtStore.getTxt(id: "newExercises"))
                                .font(dh.getFontButton(design: userData.design))
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 10)
                            Text(lblTxtStore.getTxt(id: "sameSettings"))
                            .font(dh.getFontMini(design: userData.design))
                                .offset(y: -7)
                                .padding(.bottom, 2)
                        }
                        .foreground(gradientCherryAndPink)
//                        .shadow(radius: 2, y: 1)
                    }
                    .frame(width: dh.getMainButtonWidth(design: userData.design))
                    .background(dh.getCherryPinkBackgroundGradient(design: userData.design))
                    .foregroundColor(search.selectedOperations.count == 0 ? .gray : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .disabled(search.selectedOperations.count == 0)

                    // Zurück
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            self.backToMain()
                        }
                    }) {

                        VStack() {
                            HStack(){
                                Image(systemName: "chevron.left")
                                Text(lblTxtStore.getTxt(id: "back"))
                                .font(dh.getFontButton(design: userData.design))
                            }
                            .foreground(gradientSeaAndBlue)
                            .padding(10)
                        }
                    }
                    .frame(width: dh.getMainButtonWidth(design: userData.design))
                    .background(dh.getSeaGreenBackgroundGradient(design: userData.design))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 20)

                }
                .animation(.spring())
                Spacer()
            }
            .background(BlurDynamic(design: userData.design == "blackboard" ? .dark : .light))
            .shadow(radius: 2, y: 1)

            }
    }
}



struct CalcMenu: View {
    @EnvironmentObject var userData: UserData
    //@ObservedObject var search = SearchData()
    //@State var navBarHidden: Bool = true
    @ObservedObject var lblTxtStore = LabelTextStore()
    @Binding var enteredResult: String
    @Binding var calcMenuOffset: CGFloat
    @Binding var finishedMenuOffset: CGFloat
    
    
    var pendingTasks: [Task] {
        userData.calcTasks.filter { $0.isPending }
    }
    
    var calculatedTasks: [Task] {
        userData.calcTasks.filter { $0.isCorrect || $0.isIncorrect || $0.isSkipped || $0.isCanceled}
    }
    
    var correctTasks: [Task] {
        userData.calcTasks.filter { $0.isCorrect }
    }
    
    var incorrectTasks: [Task] {
        userData.calcTasks.filter { $0.isIncorrect }
    }
    
    var skippedTasks: [Task] {
        userData.calcTasks.filter { $0.isSkipped }
    }
    
    var cancelledTasks: [Task] {
        userData.calcTasks.filter { $0.isCanceled }
    }

    let dh: DesignHandler = DesignHandler()
    
    
    
    func getIntValue(value: String) -> Int {
        if value != "" {
            return Int(value)!
        }
        return 0
    }
    
    func calc() {
        let indexOfCalcTask = userData.calcTasks.firstIndex(of: pendingTasks[0])
        if getIntValue(value: enteredResult) == pendingTasks[0].calculatedResult {
            userData.calcTasks[indexOfCalcTask!].enteredResult = getIntValue(value: enteredResult)
            userData.calcTasks[indexOfCalcTask!].isPending = false
            userData.calcTasks[indexOfCalcTask!].isCorrect = true
            userData.calcTasks[indexOfCalcTask!].isIncorrect = false
            enteredResult = ""
        } else {
            userData.calcTasks[indexOfCalcTask!].enteredResult = getIntValue(value: enteredResult)
            userData.calcTasks[indexOfCalcTask!].isPending = false
            userData.calcTasks[indexOfCalcTask!].isCorrect = false
            userData.calcTasks[indexOfCalcTask!].isIncorrect = true
            userData.calcTasks[indexOfCalcTask!].calcStatus = .incorrect
            enteredResult = ""
        }
        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }
    }

    
    func cancelCalc() {
        for task in pendingTasks {
            let index = userData.calcTasks.firstIndex(of: task)!
            userData.calcTasks[index].calcStatus = .canceled
            userData.calcTasks[index].isPending = false
            userData.calcTasks[index].isCanceled = true
            enteredResult = ""
            
        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }
        }
    }
    
    func skipCalc() {
        let index = userData.calcTasks.firstIndex(of: pendingTasks.first!)!
            userData.calcTasks[index].calcStatus = .skipped
            userData.calcTasks[index].isPending = false
            userData.calcTasks[index].isSkipped = true
            enteredResult = ""
        
        if pendingTasks.count == 0 {
            self.calcMenuOffset = offsetCollapsed
            self.finishedMenuOffset = offsetExpanded
        } else {
            self.calcMenuOffset = offsetExpanded
            self.finishedMenuOffset = offsetCollapsed
        }
    }

    var body: some View {
        VStack() {
            Spacer()
            ZStack(){
                
                HStack() {
                    Spacer()
                    VStack() {
                                                                        
                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                self.calc()
                            }
                        }) {
                            HStack(){
                                Spacer()
                                Image(systemName: "paperplane")
                                Text(lblTxtStore.getTxt(id: "check"))
                                    .font(dh.getFontButton(design: userData.design))
                                Spacer()
                                
                            }
                            .foreground(gradientSeaAndBlue)
                        }
                        .frame(width: dh.getMainButtonWidth(design: userData.design), height: 40)
                            .background(dh.getSeaGreenBackgroundGradient(design: userData.design))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.top, 10)
                        .disabled(enteredResult == "")
                        .opacity(enteredResult == "" ? 0.1 : 1.0)
                            
                        HStack() {
                            Button(action: {
                                self.skipCalc()
                            }) {
                                HStack(){
                                    Spacer()
                                    Image(systemName: "forward.end.alt")
                                    Text(lblTxtStore.getTxt(id: "skip"))
                                        .font(dh.getFontSettingText(design: userData.design))
                                        .allowsTightening(true)
                                    Spacer()
                                }
        //                        .foreground(dh.getInvertedPeachPinkGradient(design: userData.design))
                                .foreground(gradientCherryAndPink)
//                                .shadow(radius: 2, y: 1)
                            }
//                            .frame(width: dh.getMainButtonWidth(design: userData.design), height: 40)
                            .background(dh.getPeachPinkBackgroundGradient(design: userData.design))
                            .foregroundColor(.white)
        //                    .foreground(gradientPeachAndPink)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            Button(action: {
                                self.cancelCalc()
                            }) {
                                HStack(){
                                    Spacer()
                                    Image(systemName: "trash")
        //                                Text("Abbrechen")
                                    Text(lblTxtStore.getTxt(id: "cancel"))
                                    .font(dh.getFontSettingText(design: userData.design))
                                    Spacer()
                                }
//                                .foreground(gradientSeaAndBlue)
                                    .foreground(gradientCherryAndPink)
//                                .shadow(radius: 2, y: 1)
                            }
//                            .frame(width: dh.getMainButtonWidth(design: userData.design), height: 40)
                            .background(dh.getPeachPinkBackgroundGradient(design: userData.design))
                            .foregroundColor(.white)
        //                    .foreground(gradientPeachAndPink)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .padding(.bottom, 20)
                            
                            }
                            .padding(.bottom, 20)
                            .animation(.spring())
                            Spacer()
                }
//                .background(BlurDark())
                    .background(BlurDynamic(design: userData.design == "blackboard" ? .dark : .light))
//                .cornerRadius(20)
                .shadow(radius: 2, y: 1)
            }

            }
    }
}
