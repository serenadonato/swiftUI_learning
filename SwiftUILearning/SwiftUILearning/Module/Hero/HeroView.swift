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
    func showDogDetails(_ dog: Dog) {
        
    }
    
    func showError(_ message: String) {
        
    }
    
    @ObservedObject var presenter: Presenter
    
    init(presenter: Presenter) {
        self.presenter = presenter
    }
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            CustomCircle(width: 100, height: 100, color: Color("Turquesa"))
            
            HStack {
                CustomCircle(width: 40, height: 40, color: .red)
                CustomCircle(width: 40, height: 40, color: .yellow)
                CustomCircle(width: 40, height: 40, color: .green)
            }
            .frame(width: 50,height: 50)
            .offset(x:UIScreen.main.bounds.width / 2)
            CustomRectangle(width: 300, height: 300, color: .teal)
            if presenter.dataHero != nil {
                
                AsyncImage(url: URL(string: presenter.dataHero?.url ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 200)
                    case .failure(let error):
                        // Vista de error en caso de fallo en la carga de la imagen
                        Text("Error: \(error.localizedDescription)")
                    case .empty:
                        ProgressView()
                    @unknown default:
                        ProgressView()
                    }
                }
            }
            
            
            CustomCircle(width: 100, height: 100, color: Color("Celeste"))
                .frame(width: 50,height: 50)
                .offset(y:UIScreen.main.bounds.height/2 + 100)
            
            HStack {
                Button(action: {
                    presenter.fetchHeroImage()
                }) {
                    CustomRectangle(width: 70, height: 40, color: .green)
                }
                
                Button(action: {
                    presenter.fetchHeroImage()
                }) {
                    CustomRectangle(width: 70, height: 40, color: .indigo)
                }
            }
            .offset(x:UIScreen.main.bounds.width/10, y: UIScreen.main.bounds.height/4)
            
            
            
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

