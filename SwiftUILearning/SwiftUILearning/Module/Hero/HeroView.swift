//
//  HeroView.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 14/07/2023.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color("Turquesa"))
                .offset(x: -130, y: -300)
            
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.red)
                .offset(x: -20, y: -290)
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.yellow)
                .offset(x: 30, y: -290)
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.green)
                .offset(x: 80, y: -290)
            
            Rectangle()
                .frame(width: 300,height: 300)
                .foregroundColor(Color("Turquesa"))
            
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color("Celeste"))
                .offset(x: -130, y: 240)
            
            Rectangle()
                .frame(width: 70,height: 40)
                .foregroundColor(.green)
                .offset(x: -30, y: 240)
            
            Rectangle()
                .frame(width: 70,height: 40)
                .foregroundColor(.indigo)
                .offset(x: 60, y: 240)
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}


