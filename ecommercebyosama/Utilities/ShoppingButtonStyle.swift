//
//  ShoppingButtonStyle.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 10/04/2023.
//

import SwiftUI

struct AddCartButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(systemName: configuration.isPressed ? "cart.badge.plus" : "cart")
                Spacer()
            }
            HStack {
                Spacer()
                if configuration.isPressed {
                    Text("Added to Cart").bold()
                        .foregroundColor(.tertiary)
                } else {
                    configuration.label
                }
                Spacer()
            }
        }
        .foregroundColor(.tertiary)
        .padding()
        .background(
            Group{
                if configuration.isPressed {
                    Color.green
                } else {
                    Color.darkText
                }
            }
        )
        .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
