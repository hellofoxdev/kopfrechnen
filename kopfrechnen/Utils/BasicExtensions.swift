//
//  BasicExtensions.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 01.06.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import Foundation
import SwiftUI

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
    }
    
    static func chalkduster(size: Int) -> Font {
        return Font.custom("Chalkduster", size: CGFloat(size))
    }
    
    static func kgNoRegretsSketch(size: Int) -> Font {
        return Font.custom("KG No Regrets Sketch", size: CGFloat(size))
    }
    
    static func chalk(size: Int) -> Font {
        return Font.custom("Coconut Punch", size: CGFloat(size))
    }
    
    static func kgBlankSpaceSketch_repair(size: Int) -> Font {
        return Font.custom("KG Blank Space Sketch", size: CGFloat(size))
    }
}

// MARK: - API
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    public func foreground<Overlay: View>(_ overlay: Overlay) -> some View {
        self.overlay(overlay).mask(self)
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .bottom)
//            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .bottom)
//            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
extension AnyTransition {
    static var fade: AnyTransition {
        let insertion = AnyTransition.opacity
//            .combined(with: .opacity)
        let removal = AnyTransition.opacity
//            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
