//
//  DecorativeLineComponent.swift
//  SwiftUILearning
//
//  Created by Saldivar on 17/08/23.
//

import SwiftUI

private struct DecorativeLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 10,
                              y: rect.maxY * 0.5))
        path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.2,
                                 y: rect.maxY * 0.5))
        
        path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.4,
                                 y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX - 10,
                                 y: rect.minY))
        
        return path
    }
}

struct DecorativeLineComponent: View {
    var body: some View {
        DecorativeLineShape()
            .stroke(.gray, style: .init(lineWidth: 10, lineCap: .round))
            
    }
}

struct DecorativeLineComponent_Previews: PreviewProvider {
    static var previews: some View {
            DecorativeLineComponent()
            .frame(width: 100, height: 50)
    }
}
