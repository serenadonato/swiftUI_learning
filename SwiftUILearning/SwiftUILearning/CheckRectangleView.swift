//
//  CheckRectangleView.swift
//  SwiftUILearning
//
//  Created by Facundo Barboza on 22/06/2023.
//

import Foundation
import SwiftUI

struct CheckRectangleView: View {
    
    let avatar: String
    
    var body: some View {
        ZStack {
            Image(avatar)
              .frame(width: 46, height: 46)
              .background(
                Color(uiColor: UIColor(red: 205/255, green: 240/255, blue: 229/255, alpha: 1))
              )
              .cornerRadius(14)
        }
        .frame(width: 64, height: 64)
    }
}
