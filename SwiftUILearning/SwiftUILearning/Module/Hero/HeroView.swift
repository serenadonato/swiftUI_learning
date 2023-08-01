//
//  HeroView.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 14/07/2023.
//

import SwiftUI
import Combine

protocol HeroViewProtocol {
    func showError(_ message: String)
}

struct HeroView <Presenter: HeroPresenterProtocol>: View, HeroViewProtocol {
    func showError(_ message: String) {}
    
    @ObservedObject var presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    CustomCircle(width: 100, height: 100, color: Color("Turquesa"))
                        .padding()
                    Spacer()
                    SpheresView()
                        .frame(width: 50,height: 50)
                        .offset(x:-60,y: 0)
                }.offset(y:-130)
                ZStack {
                    CustomRectangle(width: 300, height: 300, color: .teal)
                    HeroImageView(presenter: presenter) {
                        Text("Buscá un superheroe")
                    }
                }.offset(y:-100)
            }
            HStack {
                CustomCircle(width: 100, height: 100, color: Color("Celeste"),icon: "mic",colorIcon: .white)
                    .frame(width: 40,height: 40)
                    .offset(x:35,y: 20)
                Spacer()
               DobleButtons(presenter: presenter)
                .padding()
                .offset(y:40)
            }
            .offset(y:170)
            
            JoystickView(presenter: presenter)
                .offset(x:UIScreen.main.bounds.width/10, y:UIScreen.main.bounds.height/3)
        }
        
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView<HeroPresenter>.compose()
    }
}

extension HeroView {
    static func compose() -> HeroView<HeroPresenter> {
        let presenter = HeroPresenter.compose()
        let view = HeroView<HeroPresenter>.init(presenter: presenter)
        presenter.view = view
        return view
    }
}

