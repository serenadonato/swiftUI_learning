//
//  DecorativePreviewComponent.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 24/08/2023.
//

import SwiftUI

struct CustomRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path: Path = .init()
        path.move(to: .init(x: rect.minX, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX , y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX + (rect.maxX) * 0.15, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY * 0.85))
        path.closeSubpath()
        return path
    }
    
}
struct DecorativePreviewComponent: View {
    var body: some View {
        ZStack {
            CustomRectangle()
                .stroke(Color.black, lineWidth: 5)
                .overlay(CustomRectangle()
                    .fill(Color.gray))
                .frame(width: 100, height: 50)
        }
    }
}

struct DecorativePreviewComponent_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            
            Color.red.ignoresSafeArea()
            DecorativePreviewComponent()
            DecorativePreviewComponent()
        }
    }
}
