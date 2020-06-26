//
//  MainView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 14.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var search = SearchData()
    @ObservedObject var lblTxtStore = LabelTextStore()
    @State var navBarHidden: Bool = true
    
    let dh: DesignHandler = DesignHandler()
    
    func getPaddingSizie() -> CGFloat {
        if search.selectedOperations.count == 0 {
            return 10
        }
        return 10
    }
    
    func changeDesign() {
        if userData.design == "white" {
            userData.design = "blackboard"
        } else {
            userData.design = "white"
        }
    }
    
    var body: some View {
        
//        NavigationView {
        ZStack(){
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
            
            VStack() {
                Spacer()

                
                Button(action: {
//                    withAnimation(.linear(duration: 0.2)) {
                        initTasks(search: self.search, userData: self.userData)
//                    }
                }) {

                    VStack() {
                        HStack(){
//                            Spacer()
                            Image(systemName: "repeat")
//                            Spacer()
//                            Text("Neue Aufgaben")
                            Text(lblTxtStore.getTxt(id: "newExercises"))
//                            .font(.avenirNextRegular(size: 18))
                            .font(dh.getFontButton(design: userData.design))
                        }
                            .foreground(dh.getInvertedCherryPinkGradient(design: userData.design))
                            .shadow(radius: 2, y: 1)
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                        .padding(.bottom, getPaddingSizie())
                    }
                }
                .frame(width: dh.getMainButtonWidth(design: userData.design))
                .background(dh.getCherryPinkBackgroundGradient(design: userData.design))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .disabled(search.selectedOperations.count == 0)
                .opacity(search.selectedOperations.count == 0 ? 0.3 : 1.0)
//                .padding(.top, 30)
                
                
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            openLittleOnce(userData: self.userData)
                        }
                    }) {

                        VStack() {
                            HStack(){
                                Image(systemName: "table")
                                Text(lblTxtStore.getTxt(id: "littleOnce"))
                                .font(dh.getFontButton(design: userData.design))
                            }
                            .foreground(dh.getInvertedCherryPinkGradient(design: userData.design))
                            .shadow(radius: 2, y: 1)
                            .padding(10)
                        }
                    }
                    .frame(width: dh.getMainButtonWidth(design: userData.design))
//                    .background(gradientCherryAndPink)
                    .background(dh.getCherryPinkBackgroundGradient(design: userData.design))
//                    .background(gradientOrangeAndYellow)
//                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .shadow(radius: 5)

                
                Button(action: {
                    withAnimation(.linear(duration: 0.2)) {
                        openMenu(userData: self.userData)
                    }
                }) {

                    VStack() {
                        HStack(){
//                            Spacer()
                            Image(systemName: "wrench")
                            Text(lblTxtStore.getTxt(id: "settings"))
                                .font(dh.getFontButton(design: userData.design))
                        }
                        .foreground(dh.getInvertedCherryPinkGradient(design: userData.design))
                        .shadow(radius: 2, y: 1)
                        .padding(10)
                    }
                }
                .frame(width: dh.getMainButtonWidth(design: userData.design))
                .background(dh.getPeachPinkBackgroundGradient(design: userData.design))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                if search.selectedOperations.count == 0 {
                    Text(lblTxtStore.getTxt(id: "selectOperationMain"))
                        .font(.avenirNextRegular(size: 10))
                        .fontWeight(.semibold)
                        .foreground(gradientCherryAndPink)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            .padding(.bottom, 100)
            VStack(){
                Spacer()
            
//                HStack(alignment: .bottom) {
//                    VStack() {
                            Button(action: {
                               withAnimation(.linear(duration: 0.2)) {
                                   openGirlsView(userData: self.userData)
                               }
                           }) {
                                                
                            VStack() {
                                Spacer()
                                Image(systemName: "heart")
                                .font(.avenirNextRegular(size: 28))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                
                                Text(lblTxtStore.getTxt(id: "forTheGirls"))
    //                                .font(.avenirNextRegular(size: 18))
                                    .font(dh.getFontGirls(design: userData.design))
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                
                                Text(lblTxtStore.getTxt(id: "yourDad"))
                                .font(dh.getFontGirls(design: userData.design))
    //                                .font(.avenirNextRegular(size: 18))
                                    .padding(.bottom, 10)
                                    .frame(minWidth: 0, maxWidth: .infinity)

                                }
                                .frame(height: 150)
//                            .background(Color .red)
                            .foreground(dh.getCherryPinkGradient(design: userData.design))
                        }
                        
                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                openVersionView(userData: self.userData)
                            }
                        }) {
                            HStack(){
                                Spacer()
                                HStack() {
                                    Text("Version 1.1")
                                    .font(dh.getFontMini(design: userData.design))
                                        .foreground(Color .white)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 10)
                                }
                                    .background(userData.design == "blackboard" ? gradientCherryAndPink : gradientSeaAndBlue)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .padding(.bottom, 30)
                                
                                Spacer()
                            }
                        }
//                    }
            }
        }
//        }
        .background(Color .white)
        .navigationBarTitle("")
        .navigationBarHidden(self.navBarHidden)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.navBarHidden = true
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.navBarHidden = false
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
