//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by Serena Donato on 08/06/2023.
//

import SwiftUI

@main
struct SwiftUILearningApp: App {
    var body: some Scene {
        WindowGroup {
            //ListRootView()
            VStack {
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .bottom)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .center)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .top)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .leading)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .trailing)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .topLeading)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .topTrailing)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .bottomLeading)
                GradientCircleComponent(colors: [.red.opacity(0.1),
                                                 .red.opacity(0.9)], center: .bottomTrailing)
            }
        }
    }
}
