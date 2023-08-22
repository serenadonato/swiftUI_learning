//
//  GradiantColors.swift
//  SwiftUILearning
//
//  Created by Flaminia Castaño on 22/08/2023.
//

import SwiftUI

extension Array where Element == Color {
    static func of(_ color: Color) -> Self {
        [color.opacity(0.4),
         color.opacity(1)]
    }
}
