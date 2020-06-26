//
//  GirlsView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 01.06.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct GirlsView: View {
        
        @ObservedObject var search = SearchData()
        @ObservedObject var lblTxtStore = LabelTextStore()
        @EnvironmentObject var userData: UserData
        
        let dh: DesignHandler = DesignHandler()
        
        
        var body: some View {

            ZStack() {
                VStack() {
                    Text(lblTxtStore.getTxt(id: "iloveyou")) // iloveyou
                        .font(dh.getFontHeadline(design: userData.design))
                        .foreground(gradientCherryAndPink)
                        .padding(.top, 50)
                    Spacer()
                }
                ScrollView() {
                    ZStack() {
                        VStack() {
                            Image("girlsbw")
                                .resizable()
                                .scaledToFill()
    //                            .edgesIgnoringSafeArea(.all)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

                        }
                        
                        VStack() {
                            Spacer()
                            HStack(){
                                Text("Caro")
                                    .font(dh.getFontHeadline(design: userData.design))
                                    .allowsTightening(true)
                                    .lineLimit(1)
                                    .foreground(gradientCherryAndPink)
        
                                Spacer()
                                
                                Text("Mira")
                                    .font(dh.getFontHeadline(design: userData.design))
                                    .allowsTightening(true)
                                    .foreground(gradientCherryAndPink)
                                    .lineLimit(1)
                            }
//                            .foreground(gradientCherryAndPink)
                            .padding(.horizontal, 20)
                            
                            Rectangle().fill(Color .clear)
                                .frame(height: 60)
                        }
                    }
                }
                .background(Color .clear)
                    
                VStack() {
                    Spacer()
                    HStack() {
                        
                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                closeGirlsView(userData: self.userData)
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
//            .cornerRadius(15)
            .navigationBarHidden(true)
            .navigationBarTitle("")
//            .shadow(radius: 2, y: 1)
        }
}

struct GirlsView_Previews: PreviewProvider {
    static var previews: some View {
        GirlsView()
    }
}
