//
//  ColorsBallsComponent.swift
//  SwiftUILearning
//
//  Created by Matias Palmieri on 10/08/2023.
//

import SwiftUI

struct ColorsBallsComponent: View {
    var body: some View {
        HStack{
            GradientCircleComponent(colors: [.blue.opacity(0.4),
                                             .blue.opacity(1)],
                                    center: .center,
                                    stroke: (Color.black.opacity(0.8), 5))
            
            GradientCircleComponent(colors: [.yellow.opacity(0.4),
                                             .yellow.opacity(1)],
                                    center: .center,
                                    stroke: (Color.black.opacity(0.8), 5))
            
            GradientCircleComponent(colors: [.red.opacity(0.4),
                                             .red.opacity(1)],
                                    center: .center,
                                    stroke: (Color.black.opacity(0.8), 5))
        }
    }
}

struct ColorsBallsComponent_Previews: PreviewProvider {
    static var previews: some View {
        ColorsBallsComponent().frame(width: 300)
    }
}
