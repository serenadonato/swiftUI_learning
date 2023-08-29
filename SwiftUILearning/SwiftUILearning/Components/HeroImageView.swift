//
//  HeroImageView.swift
//  SwiftUILearning
//
//  Created by Lucas Emiliano Benitez Joncic on 31/07/2023.
//
import SwiftUI

struct HeroImageView<Content: View,Presenter: HeroPresenterProtocol>: View, HeroViewProtocol {
    func showError(_ message: String) {}
    
    @ObservedObject var presenter: Presenter
    @ViewBuilder var content: Content
    
    var body: some View {
        if let hero = presenter.dataHero {
            AsyncImage(url: URL(string: hero.url)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 200)
                case .failure(_):
                    // Vista de error en caso de fallo en la carga de la imagen
                    Text("Ups! Ocurrió un error")
                case .empty:
                    ProgressView()
                @unknown default:
                    ProgressView()
                }
            }
        } else {
            content
        }
    }
}

struct HeroImageView_Previews: PreviewProvider {
    static var previews: some View {
        let heroPresenter = HeroPresenter.compose()
        
        return HeroImageView(presenter: heroPresenter) {
            Text("No se encontró el héroe")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

extension HeroImageView {
    static func compose(content: @escaping () -> Content) -> HeroImageView<Content, HeroPresenter> {
            let presenter = HeroPresenter.compose()
        let view = HeroImageView<Content,HeroPresenter>.init(presenter: presenter, content: content)
            presenter.view = view
            return view
        }
}
