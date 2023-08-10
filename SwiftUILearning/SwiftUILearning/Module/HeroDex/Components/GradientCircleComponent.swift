//
//  GradientCircleComponent.swift
//  SwiftUILearning
//
//  Created by Saldivar on 08/08/23.
//

import SwiftUI
struct GradientCircleComponent: View {
    var colors: [Color]
    var center: UnitPoint
    var stroke: (color: Color, lineWidth: CGFloat)?
    
    init(colors: [Color],
         center: UnitPoint = .center,
         stroke: (color: Color, lineWidth: CGFloat)? = nil) {
        self.colors = colors
        self.center = center
        self.stroke = stroke
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(RadialGradient(gradient: .init(colors: colors),
                                         center: center,
                                         startRadius: 5,
                                         endRadius: geometry.size.width / 2))
                    .aspectRatio(contentMode: .fit)
                if let stroke = stroke {
                    Circle()
                        .stroke(stroke.color,
                                lineWidth: stroke.lineWidth)
                }
            }
        }.aspectRatio(contentMode: .fit)
        
    }
}

struct GradientCircleComponent_Previews: PreviewProvider {
    static var previews: some View {
        GradientCircleComponent(colors: [.brown.opacity(0.4),
                                         .brown.opacity(1)],
                                center: .center,
                                stroke: (Color.black.opacity(0.5), 5))
        .frame(width: 200)
    }
}
