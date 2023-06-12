//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Serena Donato on 08/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section(header: HeaderView()) {
                LoanRowView(price: "$10.000", date: "20/06/2022 - 20/10/2022")
                LoanRowView(price: "$20.000", date: "25/02/2023 - 25/06/2023")
                LoanRowView(price: "$150.000", date: "25/04/2023 - 25/08/2023")
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Historial de Préstamos")
                .font(.system(size: 20, weight: .semibold))
        }
        .padding(.vertical)
    }
}

struct LoanRowView: View {
    var price: String
    var date: String
    
    init(price: String, date: String) {
        self.price = price
        self.date = date
    }
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("background_green"))
                    .frame(width: 55, height: 50)
                    .padding(.trailing, 20)
                
                Image(systemName: "checkmark")
                    .foregroundColor(Color("check_green"))
                    .font(.system(size: 25, weight: .bold))
                    .padding(.trailing, 20)
            }
            
            VStack(alignment: .leading) {
                Text(price)
                    .font(.system(size: 20, weight: .regular))
                Text(date)
                    .font(.system(size: 15, weight: .light))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
