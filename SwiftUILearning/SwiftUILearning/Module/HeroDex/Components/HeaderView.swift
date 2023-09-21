//
//  HeaderView.swift
//  SwiftUILearning
//
//  Created by Saldivar on 17/08/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                SpeechIndicatorComponent(blinkSpeed: 2, blinkColor1: Color(red: 0.2, green: 0.6, blue: 1.0),
                                         blinkColor2: Color.blue).frame(width: 80)
                Spacer()
                ColorsBallsComponent().frame(width: 100)
            }.padding()
            DecorativeLineComponent().frame(height: 100).offset(x: 0, y: 60).padding()
        }.background(Color.red)
//            .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView()
            Spacer()
        }
    }
}
