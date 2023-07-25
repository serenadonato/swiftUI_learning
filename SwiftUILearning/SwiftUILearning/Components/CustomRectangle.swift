//
//  CustomRectangle.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 24/07/2023.
//

import SwiftUI

struct CustomRectangle: View {
    var width: CGFloat
    var height: CGFloat
    var color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: width,height: height)
            .foregroundColor(color)
    }
}

struct CustomRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CustomRectangle(width: 300, height: 300, color: Color("Turquesa"))
    }
}
