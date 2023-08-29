//
//  JoystickView.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 31/07/2023.
//

import SwiftUI

struct JoystickView <Presenter: HeroPresenterProtocol>: View, HeroViewProtocol {
   
    func showError(_ message: String) {}
    
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        VStack {
            VStack {
                Button(action: {
                    presenter.fetchHeroImage()
                }) {
                    CustomRectangle(width: 50, height: 70, color: .black,icon: "arrow.up",colorIcon: .white)
                }
                .padding(.bottom,10)
                .cornerRadius(15)
                HStack {
                    Button(action: {
                        presenter.fetchHeroImage()
                    }) {
                        CustomRectangle(width: 70, height: 50, color: .black,icon: "arrow.left",colorIcon: .white)
                    }
                    .padding(.trailing,30)
                    .cornerRadius(15)
                    
                    Button(action: {
                        presenter.fetchHeroImage()
                    }) {
                        CustomRectangle(width: 70, height: 50, color: .black,icon: "arrow.right",colorIcon: .white)
                    }
                    .padding(.leading,30)
                    .cornerRadius(15)
                }
            }
            VStack {
                Button(action: {
                    presenter.fetchHeroImage()
                }) {
                    CustomRectangle(width: 50, height: 70, color: .black,icon: "arrow.down",colorIcon: .white)
                }
                .padding(.top,10)
                .cornerRadius(15)
            }
        }
    }
}

struct JoystickView_Previews: PreviewProvider {
    static var previews: some View {
        JoystickView<HeroPresenter>.compose()
    }
}

extension JoystickView {
    static func compose() -> JoystickView<HeroPresenter> {
        let presenter = HeroPresenter.compose()
        let view = JoystickView<HeroPresenter>.init(presenter: presenter)
        presenter.view = view
        return view
    }
}
