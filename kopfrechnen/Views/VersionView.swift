//
//  VersionView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 01.06.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct VersionView: View {
    
    @ObservedObject var search = SearchData()
    @ObservedObject var lblTxtStore = LabelTextStore()
    @EnvironmentObject var userData: UserData
    
    let dh: DesignHandler = DesignHandler()
    
    
    var body: some View {

        ZStack() {
            VStack() {
                        
                ScrollView(){
                    
                    HStack(){
                        Text(lblTxtStore.getTxt(id: "versionHistory"))
                            .font(dh.getFontHeadline(design: userData.design))
                            .fontWeight(.light)
                            .allowsTightening(true)
                            .lineLimit(1)
                            .foreground(gradientCherryAndPink)
                        Spacer()
                    }
                    .frame(height: 60)
                    .background(Color .clear)
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
//                    .padding(.bottom, 10)

                    

                    Group {
                        HStack() {
                            Text("1.1")
                                .font(dh.getFontSettingText(design: userData.design))
                                .fontWeight(.light)
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 10)

                        HStack() {
                            Text(lblTxtStore.getTxt(id: "version_1.1_newDesign"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)

                        HStack() {
                            Text(lblTxtStore.getTxt(id: "version_1.1_addEnglish"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)

                        HStack() {
                            Text(lblTxtStore.getTxt(id: "version_1.1_littleOnce"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)

                        HStack() {
                            Text(lblTxtStore.getTxt(id: "version_1.1_minorBugFix"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                    }
                    
                    Group {
                        HStack() {
                            Text("1.0")
                                .font(dh.getFontSettingText(design: userData.design))
                                .fontWeight(.light)
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                        
                        HStack() {
                            Text(lblTxtStore.getTxt(id: "version_1_init"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                    }

                    HStack(){
                        Text(lblTxtStore.getTxt(id: "licences"))
                            .font(dh.getFontHeadline(design: userData.design))
                            .fontWeight(.light)
                            .allowsTightening(true)
                            .lineLimit(1)
                            .foreground(gradientCherryAndPink)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                        Spacer()
                    }.frame(height: 60)


                    Group {
                        HStack() {
                            Text(lblTxtStore.getTxt(id: "licenceSQLite"))
                                .font(dh.getFontSettingText(design: userData.design))
                                .fontWeight(.light)
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        
                        
                        HStack() {
                            Text(lblTxtStore.getTxt(id: "licenceTextSQLite"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        
                        
                        HStack() {
                            Text(lblTxtStore.getTxt(id: "licenceTextSQLite_1"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                        
                        
                        HStack() {
                            Text(lblTxtStore.getTxt(id: "licenceFontCoconutPunch"))
                                .font(dh.getFontSettingText(design: userData.design))
                                .fontWeight(.light)
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        
                        
                        HStack() {
                            Text(lblTxtStore.getTxt(id: "licenceTextFontCoconutPunch"))
                                .font(dh.getFontMini(design: userData.design))
                                .foreground(dh.getFontColor(design: userData.design))
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                    
                    }

                    Spacer()
                    Rectangle().fill(Color .clear)
                        .frame(height: 110)

                    }
                    .background(Color .clear)

            }
            .background(Color .clear)
                
            VStack() {
                Spacer()
                HStack() {
                    
                    Button(action: {
                        withAnimation(.linear(duration: 0.2)) {
                            closeVersionView(userData: self.userData)
                        }
                    }) {
                        HStack(){
                            Spacer()
                            Image(systemName: "chevron.left")
                            Text(lblTxtStore.getTxt(id: "back"))
                                .lineLimit(1)
                            .font(dh.getFontButton(design: userData.design))
                            Spacer()
                        }
                        .foreground(gradientSeaAndBlue)
                            
                        .padding(10)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                .padding(.bottom, 20)
                .background(BlurDynamic(design: userData.design == "blackboard" ? .dark : .light))
                .shadow(radius: 2, y: 1)
            }
        }
        .background(BlurDynamic(design: userData.design == "blackboard" ? .dark : .light))
//        .cornerRadius(15)
        .navigationBarHidden(true)
        .navigationBarTitle("")
//        .shadow(radius: 2, y: 1)
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView()
    }
}
