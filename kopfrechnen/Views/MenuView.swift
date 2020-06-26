//
//  ContentView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 07.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var search = SearchData()
    @ObservedObject var lblTxtStore = LabelTextStore()
    @EnvironmentObject var userData: UserData
    @State private var menuSpacer = CGFloat(60)
//    @State private var menuSpacer = CGFloat(0)
    
    let dh: DesignHandler = DesignHandler()
    

    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    func checkValues() {
        userData.isConfigurationValid = true
        
        checkNumberOfTasks()
        checkNumberRange()
        checkOperators()
        
        if userData.isConfigurationValid {
            initTasks(search: search, userData: userData)
//            self.closeMenu
        }
    }
    
    func checkOperators() {
        if search.selectedOperations.count == 0 {
            userData.isConfigurationValid = false
        }
    }
    
    func checkNumberOfTasks() {
        if search.numberOfTasks < 1 {
            userData.isConfigurationValid = false
        }
    }
    
    func checkNumberRange() {
        let minValue = getIntValue(value: search.minOperatorValue)
        let maxValue = getIntValue(value: search.maxOperatorValue)
        
        if maxValue <= minValue {
            userData.isConfigurationValid = false
        }
    }
    
    func addTaskToArray(task: Task) {
        userData.calcTasks.append(task)
    }
    
    func addOperator(operatorType: OperatorType) {
        if !search.selectedOperations.contains(operatorType) {
            search.selectedOperations.append(operatorType)
        }
    }
    
    func removeOperator(operatorType: OperatorType) {
        if search.selectedOperations.contains(operatorType) {
            search.selectedOperations.remove(at: search.selectedOperations.firstIndex(of: operatorType)!)
        }
    }
    
    func addOrRemoveOperator(operatorType: OperatorType) {
        if !search.selectedOperations.contains(operatorType) {
            addOperator(operatorType: operatorType)
        } else {
            removeOperator(operatorType: operatorType)
        }
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
    
    func getOffset() -> CGFloat {
        if userData.menuOffsetX == 0 {
            return 1
        }
        return 2
    }
    
    func changeDesign(design: String) {
        if design != "" {
            userData.design = design
        } else {
            userData.design = "white"
        }
    }
    
    var body: some View {
                
        VStack() {

            ZStack() {
            VStack() {
                        
                ScrollView(){
                    Rectangle().fill(Color .clear)
                        .frame(height: menuSpacer)
                    Group {
                        
                    HStack(){
//                        Spacer()
                        Text(lblTxtStore.getTxt(id: "configureExercises"))
                            .font(dh.getFontHeadline(design: userData.design))
                            .allowsTightening(true)
                            .lineLimit(1)
//                            .foreground(userData.design == "blackboard" ? gradientPeachAndPink : gradientCherryAndPink)
                            .foreground(userData.design == "blackboard" ? gradientCherryAndPink : gradientCherryAndPink)
                            .padding(.horizontal, 20)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                        Spacer()
                    }
                }
                    
                    Group {
                    HStack(alignment: .bottom){
                        Text(lblTxtStore.getTxt(id: "numberOfTasks"))
                        .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
//                              .foreground(userData.design == "blackboard" ? gradientPeachAndPink : gradientCherryAndPink)
                        .foreground(userData.design == "blackboard" ? gradientCherryAndPink : gradientCherryAndPink)
                        Spacer()
                    }
                    .padding(.horizontal, 20)

                    HStack(){
                        Text(String(search.numberOfTasks))
                            .font(dh.getFontSettingText(design: userData.design))
                            .foreground(dh.getFontColor(design: userData.design))
                            
                        Text(" (max. 30)")
                            .font(dh.getFontSettingsMini(design: userData.design))
                            .foreground(dh.getFontColor(design: userData.design))
                            
                        if userData.design == "blackboard" {
                        Stepper("", value: $search.numberOfTasks, in: 1...30)
                            .font(.avenirNextRegular(size: 14))
                        } else {
                            Stepper("", value: $search.numberOfTasks, in: 1...30)
                                .font(.avenirNextRegular(size: 14))
                        }
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                    }
                    
                    Group {
                        HStack(){
                            Text("\(lblTxtStore.getTxt(id: "range")) \(Int(search.maxOperatorValue))")
                                .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
//                            .foreground(userData.design == "blackboard" ? gradientPeachAndPink : gradientCherryAndPink)
                            .foreground(userData.design == "blackboard" ? gradientCherryAndPink : gradientCherryAndPink)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                            
                        HStack() {
                            Text("0")
                                .font(dh.getFontSettingsMinMax(design: userData.design))
                            .fontWeight(.semibold)
                            .foreground(dh.getFontColor(design: userData.design))
                            
                            Slider(value: $search.maxOperatorValue, in: 0...100, step: 1)
                            
                            Text("100")
                            .font(dh.getFontSettingsMinMax(design: userData.design))
                            .fontWeight(.semibold)
                            .foreground(dh.getFontColor(design: userData.design))
                        }
                        .padding(.horizontal, 30)
                    }
                    
                    Group {
                        HStack() {
                                Text(lblTxtStore.getTxt(id: "arithmeticOperations"))
                                    .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
//                            .foreground(userData.design == "blackboard" ? gradientPeachAndPink : gradientCherryAndPink)
                            .foreground(userData.design == "blackboard" ? gradientCherryAndPink : gradientCherryAndPink)
                            Spacer()
                            }
                        .padding(.horizontal, 20)
                            .padding(.top, 10)
                        
                        if (self.search.selectedOperations.count == 0) {
                        HStack() {
                            Text(lblTxtStore.getTxt(id: "selectOperation"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        }

                        VStack(){
                            HStack(){
//                                Text("Plus / Addition")
                                Text(lblTxtStore.getTxt(id: "plus"))
                                .font(dh.getFontSettingText(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                                Spacer()

                                Button(action: {
                                    self.addOrRemoveOperator(operatorType: .plus)
                                }) {
                                    Image(systemName: "plus")
                                        .font(.avenirNextRegular(size: 20))
                                        .frame(width: 40 ,height:40)
                                        .background(search.selectedOperations.contains(.plus) ? gradientNightAndCherry : gradientGray)
                                        .foregroundColor(search.selectedOperations.contains(.plus) ? Color .white : Color .gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                .shadow(radius: 2, y: 1)
                            }
                            
                            
                            HStack(){
//                                Text("Minus / Subtraktion")
                                Text(lblTxtStore.getTxt(id: "minus"))
                                .font(dh.getFontSettingText(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                                Spacer()

                                Button(action: {
                                    self.addOrRemoveOperator(operatorType: .minus)
                                }) {
                                    Image(systemName: "minus")
                                        .font(.avenirNextRegular(size: 20))
                                        .frame(width: 40 ,height:40)
                                        .background(search.selectedOperations.contains(.minus) ? gradientCherryAndPink : gradientGray)
                                        .foregroundColor(search.selectedOperations.contains(.minus) ? Color .white : Color .gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                .shadow(radius: 2, y: 1)
                            }
                            
                            
                            HStack(){
//                                Text("Mal / Multiplikation")
                                Text(lblTxtStore.getTxt(id: "multiply"))
                                .font(dh.getFontSettingText(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                                Spacer()

                                Button(action: {
                                    self.addOrRemoveOperator(operatorType: .multiply)
                                }) {
                                    Image(systemName: "multiply")
                                    .font(.avenirNextRegular(size: 20))
                                    .frame(width: 40 ,height:40)
                                    .background(search.selectedOperations.contains(.multiply) ? gradientPinkAndOrange : gradientGray)
                                        .foregroundColor(search.selectedOperations.contains(.multiply) ? Color .white : Color .gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                .shadow(radius: 2, y: 1)
                            }
                            
                            
                            HStack(){
//                                Text("Geteilt / Division")
                                Text(lblTxtStore.getTxt(id: "divide"))
                                .font(dh.getFontSettingText(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                                Spacer()
                                Button(action: {
                                    self.addOrRemoveOperator(operatorType: .divide)
                                }) {
                                    Image(systemName: "divide")
                                    .font(.avenirNextRegular(size: 20))
                                    .frame(width: 40 ,height:40)
                                    .background(search.selectedOperations.contains(.divide) ? gradientOrangeAndYellow : gradientGray)
                                    .foregroundColor(search.selectedOperations.contains(.divide) ? Color .white : Color .gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                                .buttonStyle(BorderlessButtonStyle())
                                .shadow(radius: 2, y: 1)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 30)

                    }
                    
                    Group{
                        HStack(){
//                            Spacer()
                            Text(lblTxtStore.getTxt(id: "design"))
                                .font(dh.getFontHeadline(design: userData.design))
//                            .foreground(userData.design == "blackboard" ? gradientPeachAndPink : gradientCherryAndPink)
                            .foreground(userData.design == "blackboard" ? gradientCherryAndPink : gradientCherryAndPink)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 5)
                            Spacer()
                        }
                    .padding(.top, 15)
                       
                        Group {
                            VStack() {
                                Spacer()
                                
                                HStack(){
                                    Text(lblTxtStore.getTxt(id: "chalkboard"))
                                        .font(dh.getFontSettingText(design: userData.design))
                                        .foreground(dh.getFontColor(design: userData.design))
                                    
                                    Spacer()
                            
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.changeDesign(design: "blackboard")
                                        }
                                    }) {
                                        CircleImage(image: Image("blackboard"), size: 75)
                                            .overlay(
                                                
                                                VStack() {
                                                    Text(lblTxtStore.getTxt(id: "1+1"))
//                                                Text("1+1=?")
                                                        .font(dh.getFontCircleButtonsText(design: userData.design))
                                                        .fontWeight(.light)
                                                        .fixedSize(horizontal: true, vertical: true)
                                                        .foreground(gradientWhite)
                                                    
//                                                    Text("Aufgabe")
                                                    Text(lblTxtStore.getTxt(id: "exercise"))
                                                        .font(dh.getFontCircleButtonsText(design: userData.design))
                                                        .fontWeight(.light)
                                                        .fixedSize(horizontal: true, vertical: true)
                                                        .foreground(gradientWhite)
                                                }
                                        )
                                            .overlay(Circle().stroke(dh.isBlackboardSelected(design: userData.design) ? gradientSeaAndBlue : gradientGray, lineWidth: 4))
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                }

                                HStack(){
//                                    Text("Karriertes Papier")
                                    Text(lblTxtStore.getTxt(id: "quadPaper"))
                                        .font(dh.getFontSettingText(design: userData.design))
                                        .foreground(dh.getFontColor(design: userData.design))
                                    
                                    Spacer()
                            
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.changeDesign(design: "paper")
                                        }
                                    }) {
                                        CircleImage(image: Image("paper4"), size: 75)
                                            .overlay(
                                                VStack() {
//                                                Text("1+1=?")
                                                Text(lblTxtStore.getTxt(id: "1+1"))
                                                    .font(dh.getFontCircleButtonsText(design: userData.design))
                                                    .fontWeight(.light)
                                                    .fixedSize(horizontal: true, vertical: true)
                                                    .foregroundColor(.black)
                                                    
//                                                Text("Aufgabe")
                                                Text(lblTxtStore.getTxt(id: "exercise"))
                                                    .font(dh.getFontCircleButtonsText(design: userData.design))
                                                    .fontWeight(.light)
                                                    .fixedSize(horizontal: true, vertical: true)
                                                    .foreground(gradientCherryAndPink)
                                                }
                                        )
                                            .overlay(Circle().stroke(dh.isPaperSelected(design: userData.design) ? gradientSeaAndBlue : gradientGray, lineWidth: 4))
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                }

                                HStack(){
//                                    Text("Einfach weiß")
                                    Text(lblTxtStore.getTxt(id: "plainWhite"))
                                        .font(dh.getFontSettingText(design: userData.design))
                                        .foreground(dh.getFontColor(design: userData.design))
                                    
                                    Spacer()
                            
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.2)) {
                                            self.changeDesign(design: "white")
                                        }
                                    }) {
                                        Circle()
                                            .fill(Color .white)
                                            .frame(width: 75, height: 75)
                                            .overlay(
                                                VStack() {
//                                                Text("1+1=?")
                                                Text(lblTxtStore.getTxt(id: "1+1"))
                                                    .font(dh.getFontCircleButtonsText(design: userData.design))
                                                    .fontWeight(.light)
                                                    .fixedSize(horizontal: true, vertical: true)
                                                    .foregroundColor(.black)
                                                    
//                                                Text("Aufgabe")
                                                Text(lblTxtStore.getTxt(id: "exercise"))
                                                    .font(dh.getFontCircleButtonsText(design: userData.design))
                                                    .fontWeight(.light)
                                                    .fixedSize(horizontal: true, vertical: true)
                                                    .foreground(gradientCherryAndPink)
                                                }
                                        )
                                            .overlay(Circle().stroke(dh.isWhiteSelected(design: userData.design) ? gradientSeaAndBlue : gradientGray, lineWidth: 4))
                                    }
                                    .buttonStyle(BorderlessButtonStyle())
                                }
                        
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom, 80)
                        }
                    }
                    }
                    .background(Color .clear)

            }
            .background(Color .clear)
                
                VStack() {
                    Spacer()
                    HStack() {

                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                closeMenu(search: self.search, userData: self.userData)
                            }
                        }) {
                            HStack(){
                                Spacer()
                                Image(systemName: "chevron.left")
                                Text(lblTxtStore.getTxt(id: "back"))
                                    .lineLimit(1)
    //                                .font(.avenirNextRegular(size: 18))
                                .font(dh.getFontButton(design: userData.design))
    //                            .foreground(dh.getInvertedSeaBlueGradient(design: userData.design))
                                Spacer()
                            }
                            .foreground(gradientSeaAndBlue)

                            .padding(10)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding(.bottom, 20)
//                    .background(Color .white)
                    .background(BlurDynamic(design: userData.design == "blackboard" ? .dark : .light))
                    .shadow(radius: 2, y: 1)
                }
            }
//            .background(Color .white)
            .background(BlurDynamic(design: userData.design == "blackboard" ? .dark : .light))
//            .cornerRadius(15)
//                .shadow(radius: 2)
            .navigationBarHidden(true)
            .navigationBarTitle("")
//            .shadow(radius: 2, y: 1)
    }
//    .frame(minHeight: 0, maxHeight: 470)
    }
}


enum OperatorType: CaseIterable  {
    case plus, minus, multiply, divide
}

extension OperatorType: Codable {
    
    enum OperatorType: CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case unknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OperatorType.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .plus
        case 1:
            self = .minus
        case 2:
            self = .multiply
        case 3:
            self = .divide
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: OperatorType.self)
        switch self {
        case .plus:
            try container.encode(0, forKey: .rawValue)
        case .minus:
            try container.encode(1, forKey: .rawValue)
        case .multiply:
            try container.encode(2, forKey: .rawValue)
        case .divide:
            try container.encode(3, forKey: .rawValue)
        }
    }
    
}

enum CalcStatus: CaseIterable {
    case pending, correct, incorrect, canceled, skipped
}

