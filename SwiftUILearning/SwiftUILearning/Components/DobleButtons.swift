//
//  DobleButtons.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 01/08/2023.
//

import SwiftUI

struct DobleButtons<Presenter: HeroPresenterProtocol>: View, HeroViewProtocol  {
    func showError(_ message: String) {}
    
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        HStack {
            Button(action: {
                presenter.fetchHeroImage()
            }) {
                CustomRectangle(width: 70, height: 40, color: .green,colorIcon: .white, label: "Start")
            }
            .padding(.trailing,90)
            Button(action: {
                presenter.fetchHeroImage()
            }) {
                CustomRectangle(width: 70, height: 40, color: .indigo,colorIcon: .white, label: "Select")
            }
            .padding(.trailing,25)
        }
    }
}

struct DobleButtons_Previews: PreviewProvider {
    static var previews: some View {
        DobleButtons<HeroPresenter>.compose()
    }
}

extension DobleButtons {
    static func compose() -> DobleButtons<HeroPresenter> {
        let presenter = HeroPresenter.compose()
        let view = DobleButtons<HeroPresenter>.init(presenter: presenter)
        presenter.view = view
        return view
    }
}
