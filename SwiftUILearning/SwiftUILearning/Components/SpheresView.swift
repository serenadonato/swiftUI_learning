//
//  SpheresView.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 31/07/2023.
//

import SwiftUI

struct SpheresView: View {
    var body: some View {
        HStack {
            CustomCircle(width: 40, height: 40, color: .red)
            CustomCircle(width: 40, height: 40, color: .yellow)
            CustomCircle(width: 40, height: 40, color: .green)
        }
    }
}

struct SpheresView_Previews: PreviewProvider {
    static var previews: some View {
        SpheresView()
    }
}
