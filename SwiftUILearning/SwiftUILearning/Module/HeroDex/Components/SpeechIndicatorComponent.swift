//
//  SpeechIndicatorComponent.swift
//  SwiftUILearning
//
//  Created by Francisco J. Saldivar on 03/08/23.
//

import SwiftUI

struct SpeechIndicatorComponent: View {
    // Indicar la velocidad de parpadeo
    var blinkSpeed: Double
    // Estado cuando no pardaeda el color es mas solido
    var blinkColor1: Color
    // Estado cuando no pardaeda el color es mas clarito
    var blinkColor2: Color
    @State private var isBlinking = false
    
    var body: some View {
        ZStack {
            GradientCircleComponent(colors: [Color.white,
                                             blinkColor1],
                                    center: .topLeading)
            .onAppear {
                withAnimation(Animation.easeOut(duration: blinkSpeed).repeatForever(autoreverses: true)) {
                    self.isBlinking.toggle()
                }
                self.isBlinking = true
            }
            
            
            GradientCircleComponent(colors: [Color.white,
                                             blinkColor2],
                                    center: .topLeading)
            .opacity(isBlinking ? 1 : 0)
            .onAppear {
                withAnimation(Animation.easeOut(duration: blinkSpeed).repeatForever(autoreverses: true)) {
                    self.isBlinking.toggle()
                }
                self.isBlinking = !isBlinking
            }
            Circle()
                .stroke(Color.white, lineWidth: 5)
                .shadow(color: .black.opacity(0.9),
                        radius: 5, x: 0, y: 5)
                .aspectRatio(contentMode: .fit)
            
        }
    }
}

struct SpeechIndicatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        Color.yellow.ignoresSafeArea().overlay {
            SpeechIndicatorComponent(blinkSpeed: 1,
                                     blinkColor1: Color(red: 0.2, green: 0.6, blue: 1.0),
                                     blinkColor2: Color.blue)
            .frame(width: 200)
        }
    }
}
