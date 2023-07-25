//
//  CustomCircle.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 24/07/2023.
//

import SwiftUI

struct CustomCircle: View {
    var width: CGFloat
    var height: CGFloat
    var color: Color
    
    var body: some View {
        Circle()
            .frame(width: width, height: height)
            .foregroundColor(color)
            .offset(x: -130, y: -300)
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircle(width: 100, height: 100, color: Color("Turquesa"))
    }
}
