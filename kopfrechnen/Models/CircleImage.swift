//
//  CircleImage.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 26.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image!
    var size: CGFloat

    var body: some View {
        image
            .resizable()
            .renderingMode(.original)
            .frame(width: size, height: size)
            .scaledToFill()
            .clipShape(Circle())
    }
}
