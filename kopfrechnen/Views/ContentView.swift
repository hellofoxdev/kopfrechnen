//
//  ContentView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 09.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    @State var menuOffsetX: CGFloat = -UIScreen.main.bounds.width
    @State var offsetValue = CGFloat (0)
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            if userData.pageIndex == .calc {
                CalcView()
                    .background(Color .white)
//                    .edgesIgnoringSafeArea(.all)
            }

            if userData.pageIndex == .main {
                MainView()
                .background(Color .white)
                .edgesIgnoringSafeArea(.all)
            }
            
//            if userData.showMenu || userData.showLittleOnce {
//                BlurDynamic(design: userData.design == "blackboard" ? .dark : .light)
////                BlurDynamic(design: userData.design == "blackboard" ? .light : .light)
//                    .edgesIgnoringSafeArea(.all)
//            }
            MenuView()
                .edgesIgnoringSafeArea(.all)
                .offset(y: userData.menuOffsetY)
//                .offset(x: userData.menuOffsetX)
            
//            if userData.showLittleOnce {
                LittleOnceView()
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: userData.littleOnceOffsetY)
//                    .offset(x: userData.littleOnceOffsetX)
//            }
            
//            if userData.showVersion {
                VersionView()
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: userData.versionOffsetY)
//                    .offset(x: userData.versionOffsetX)
//            }
            
//            if userData.showGirls {
                GirlsView()
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: userData.girlsOffsetY)
//                    .offset(x: userData.girlsOffsetX)
//            }
                
            if userData.didSelectDesign == false {
                BlurDynamic(design: userData.design == "blackboard" ? .dark : .light)
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    Spacer()
                    DesignSelectionView()
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
            }

        }
        .background(Color .white)
        .animation(.spring())
//            .animation(.easeInOut)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum PageIndex: Int {
    case main = 0
    case calc = 1
}
