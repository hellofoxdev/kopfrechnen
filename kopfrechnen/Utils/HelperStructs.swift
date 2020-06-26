//
//  HelperStructs.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 01.06.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI
import Foundation

struct BlurDynamic: UIViewRepresentable {
    let design: UIBlurEffect.Style!
//    var style: UIBlurEffect.Style = design
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: design))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: design)
    }
}

struct Task: Hashable {
    var id: Int?
    var operatorX: Int?
    var operatorY: Int?
    var calculatedResult: Int?
    var enteredResult: Int?
    var operatorType: OperatorType
    var calcStatus: CalcStatus = .pending
    var attmept: Int = 1
    var isPending: Bool = true
    var isCorrect: Bool = false
    var isIncorrect: Bool = false
    var isCanceled: Bool = false
    var isSkipped: Bool = false
    
    init(index: Int, operatorType: OperatorType, operatorX: Int, operatorY: Int) {
        self.id = index
        self.operatorType = operatorType
        self.operatorX = operatorX
        self.operatorY = operatorY
        
        switch operatorType {
            case .plus:
                calculatedResult = operatorX+operatorY
            case .minus:
                calculatedResult = operatorX-operatorY
            case .multiply:
                calculatedResult = operatorX*operatorY
            case .divide:
                calculatedResult = operatorX/operatorY
            }
        
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct BlurDark: UIViewRepresentable {
    var style: UIBlurEffect.Style = .dark
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct BlurLight: UIViewRepresentable {
    var style: UIBlurEffect.Style = .light
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct BlurExtraLight: UIViewRepresentable {
    var style: UIBlurEffect.Style = .extraLight
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                    HStack {
                        ForEach(0 ..< self.columns, id: \.self) { column in
                                    self.content(row, column)
                        }
                    }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
