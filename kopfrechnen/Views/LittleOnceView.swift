//
//  LittleOnceView.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 20.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct LittleOnceView: View {
    @State private var menuSpacerLittleOnce = UIScreen.main.bounds.height - 500
    
    @EnvironmentObject var userData: UserData
    @ObservedObject var lblTxtStore = LabelTextStore()
    
    let dh: DesignHandler = DesignHandler()
    
    var body: some View {
//        NavigationView {
        
        VStack() {
            
//            VStack(alignment: .leading) {
                
            ScrollView([], showsIndicators: false) {
                    Rectangle().fill(Color .clear)
                        .frame(height: menuSpacerLittleOnce)
//                Text("Das kleine 1x1")
                Text(lblTxtStore.getTxt(id: "littleOnce"))
//                    .font(.avenirNextRegular(size: 24))
                    .font(dh.getFontHeadline(design: userData.design))
                    .fontWeight(.light)
                    .fixedSize(horizontal: true, vertical: true)
                    .lineLimit(1)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .foreground(gradientCherryAndPink)
                
                HStack() {
                    GridStack(rows: 10, columns: 10) { row, col in
                        Text("\((row+1) * (col+1))")
                            .font(col == row ? self.dh.getFontSettingsLitteOnceMatch(design: self.userData.design) : self.dh.getFontLittleOnceList(design: self.userData.design))
                            .fontWeight(col == row ? .semibold : .light)
                            .allowsTightening(true)
                            .frame(width: (UIScreen.main.bounds.width/14))
                        .fixedSize(horizontal: true, vertical: true)
                        .lineLimit(1)
                    }
                    .frame(width: (UIScreen.main.bounds.width - 40))
                    .padding(20)
                    .foreground(dh.getBlackGradient(design: userData.design))
                }
                        
                    Button(action: {
                        closeLittleOnce(userData: self.userData)
                    }) {
                            HStack(){
                                Spacer()
                                Image(systemName: "chevron.left")
                                Text(lblTxtStore.getTxt(id: "back"))
                                    .font(dh.getFontButton(design: userData.design))
                                Spacer()
                            }
//                            }
                                    .foreground(gradientSeaAndBlue)
                                    .shadow(radius: 2, y: 1)
                                .padding(10)
                    }
//                    .buttonStyle(BorderlessButtonStyle())
                    .background(dh.getSeaBlueBackgroundGradient(design: userData.design))
                    .padding(.horizontal, 20)
//                    .padding(.bottom, 20)
              
            }
//            .background(Color .white)
            .background(BlurDynamic(design: userData.design == "blackboard" ? .dark : .light))
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct LittleOnceView_Previews: PreviewProvider {
    static var previews: some View {
        LittleOnceView()
    }
}
