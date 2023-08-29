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
    var icon: String?
    var colorIcon: Color?
    var label: String?
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width,height: height)
                .foregroundColor(color)
            //Image(systemName: "arrow.up.left")
            Label(label ?? "", systemImage: icon ?? "").foregroundColor(colorIcon ?? .black)
                .frame(alignment: .center)
        }
    }
}

struct CustomRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CustomRectangle(width: 300, height: 300, color: Color("Turquesa"))
    }
}
