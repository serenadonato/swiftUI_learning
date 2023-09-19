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
            VStack {
                HeaderView()
                DecorativePreviewComponent(content: {
                    AnyView(Image("pikachu"))
                })
                Spacer()
            }
        }
    }
}

struct SwiftUILearningApp_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView()
            DecorativePreviewComponent(content: {
                AnyView(Image("pikachu"))
            })
            Spacer()
        }
    }
}
