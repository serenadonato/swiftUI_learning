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
            GradientCircleComponent(colors: .of(.blue),
                                    center: .center,
                                    stroke: (Color.black.opacity(0.8), 5))
            
            GradientCircleComponent(colors:.of(.yellow),
                                    center: .center,
                                    stroke: (Color.black.opacity(0.8), 5))
            
            GradientCircleComponent(colors: .of(.red),
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
