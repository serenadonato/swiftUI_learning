//
//  GradientCircleComponent.swift
//  SwiftUILearning
//
//  Created by Saldivar on 08/08/23.
//

import SwiftUI

struct GradientCircleComponent: View {
    var colors: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Circle()
                    .fill(RadialGradient(gradient: .init(colors: colors),
                                         center: .topLeading,
                                         startRadius: 5,
                                         endRadius: geometry.size.width / 2))
                    .aspectRatio(contentMode: .fit)
            }
        }.aspectRatio(contentMode: .fit)
        
    }
}

struct GradientCircleComponent_Previews: PreviewProvider {
    static var previews: some View {
        GradientCircleComponent(colors: [Color.red,
                                         .orange])
    }
}
