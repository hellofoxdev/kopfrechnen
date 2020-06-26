//
//  DesignSelectionView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 01.06.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct DesignSelectionView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var search = SearchData()
    @ObservedObject var lblTxtStore = LabelTextStore()
    let dh: DesignHandler = DesignHandler()
    let usedWidth = UIScreen.main.bounds.width/4
    
    func changeDesign(design: String) {
        if design != "" {
            userData.design = design
        } else {
            userData.design = "white"
        }
    }
    
    func letsGo() {
        userData.didSelectDesign = true
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            HStack(){
                Text(lblTxtStore.getTxt(id: "chooseDesign"))
                    .font(dh.getFontHeadline(design: userData.design))
                    .fontWeight(.light)
                    .allowsTightening(true)
                    .lineLimit(1)
                    .foreground(gradientCherryAndPink)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            HStack(){
                Text(lblTxtStore.getTxt(id: "changeDesign"))
                    .font(dh.getFontSettingsMini(design: userData.design))
//                    .fontWeight(.light)
//                    .allowsTightening(true)
//                    .lineLimit(2)
                    .foreground(dh.getBlackGradient(design: self.userData.design))
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 20)
                                
            HStack() {
                Spacer()
                
//                    VStack() {
                    Button(action: {
                        self.changeDesign(design: "blackboard")
                    }) {
                        CircleImage(image: Image("blackboard"), size: usedWidth)
                            .overlay(
                                VStack(){
    //                                Text("1+1=?")
                                    Text(lblTxtStore.getTxt(id: "1+1"))
                                        .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
                                        .fontWeight(.light)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .foreground(gradientWhite)
                                        
    //                                Text("Aufgabe")
                                    Text(lblTxtStore.getTxt(id: "exercise"))
                                        .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
                                        .fontWeight(.light)
                                        .fixedSize(horizontal: true, vertical: true)
                                        .foreground(gradientWhite)
                                    }
                    
    //                            Text("1+1=?")
    //                                .font(dh.getFontHeadline(design: userData.design))
    //                                .fontWeight(.light)
    //                                .fixedSize(horizontal: true, vertical: true)
    //                                .foreground(gradientWhite)
                                
                        )
                            .overlay(Circle().stroke(dh.isBlackboardSelected(design: userData.design) ? gradientSeaAndBlue : gradientGray, lineWidth: 4))
                        }
                    .buttonStyle(BorderlessButtonStyle())
                    
//                    Text(lblTxtStore.getTxt(id: "chalkboard"))
//                        .font(dh.getFontSettingText(design: userData.design))
//                        .foreground(dh.getFontColor(design: userData.design))
//                        .padding(.top, 10)
//
//                }
                
                Spacer()

//                VStack() {
                    Button(action: {
                        self.changeDesign(design: "paper")
                    }) {
                        CircleImage(image: Image("paper4"), size: usedWidth)
                            .overlay(
                            VStack() {
    //                            Text("1+1=?")
                                Text(lblTxtStore.getTxt(id: "1+1"))
                                    .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
                                    .fontWeight(.light)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .foregroundColor(.black)
                                    
    //                            Text("Aufgabe")
                                Text(lblTxtStore.getTxt(id: "exercise"))
                                    .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
                                    .fontWeight(.light)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .foreground(gradientCherryAndPink)
                                }
                                
                        )
                            .overlay(Circle().stroke(dh.isPaperSelected(design: userData.design) ? gradientSeaAndBlue : gradientGray, lineWidth: 4))
                        }
                    .buttonStyle(BorderlessButtonStyle())
                    
//                    Text(lblTxtStore.getTxt(id: "quadPaper"))
//                        .font(dh.getFontSettingText(design: userData.design))
//                        .foreground(dh.getFontColor(design: userData.design))
//                        .padding(.top, 10)
//                }
                Spacer()
                
//                        Spacer()

//                VStack() {
                    Button(action: {
                        self.changeDesign(design: "white")
                    }) {
    //                            CircleImage(image: Image("blackboard"), size: 70)
                            Circle()
                                .fill(Color .white)
                                .frame(width: usedWidth, height: usedWidth)
                            .overlay(
                            VStack() {
    //                            Text("1+1=?")
                                Text(lblTxtStore.getTxt(id: "1+1"))
                                    .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
                                    .fontWeight(.light)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .foregroundColor(.black)
                                    
    //                            Text("Aufgabe")
                                Text(lblTxtStore.getTxt(id: "exercise"))
                                    .font(dh.getFontSettingsLitteOnceMatch(design: userData.design))
                                    .fontWeight(.light)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .foreground(gradientCherryAndPink)
                                }
                                
                        )
                            .overlay(Circle().stroke(dh.isWhiteSelected(design: userData.design) ? gradientSeaAndBlue : gradientGray, lineWidth: 4))
    //                                .shadow(radius: 2, y: -1)
                        }
                    .buttonStyle(BorderlessButtonStyle())
                    
//                    Text(lblTxtStore.getTxt(id: "plainWhite"))
//                        .font(dh.getFontSettingText(design: userData.design))
//                        .foreground(dh.getFontColor(design: userData.design))
//                        .padding(.top, 10)
//                }
                
                Spacer()
            }
            
            Spacer()
            
            HStack() {
                Spacer()
                
                Button(action: {
                    withAnimation(.linear(duration: 0.2)) {
                        self.letsGo()
                    }
                }) {
                    HStack(){
                        Text(lblTxtStore.getTxt(id: "letsGo"))
                            .lineLimit(1)
                        .font(dh.getFontButton(design: userData.design))
                    }
                    .foreground(gradientSeaAndBlue)
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Spacer()
            }
            .padding(.vertical, 20)
            
            
        }
    }
}

struct DesignSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DesignSelectionView()
    }
}
