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
            HeroView<HeroPresenter>.compose()
        }
    }
}
