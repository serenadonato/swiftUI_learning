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
    var icon: String?
    var colorIcon: Color?
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: width, height: height)
                .foregroundColor(color)
            Label("", systemImage: icon ?? "").foregroundColor(colorIcon ?? .black)
                .frame(alignment: .center)
        }
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircle(width: 100, height: 100, color: Color("Turquesa"))
    }
}
