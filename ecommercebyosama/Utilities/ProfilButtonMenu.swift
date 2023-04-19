//
//  ProfilButtonMenu.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 10/04/2023.
//

import SwiftUI


struct ProfilButtonMenu: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .background(configuration.isPressed ? Color.tertiary : Color.secondaryBackground)
            .cornerRadius(12)
            .shadow(color: .accentColor.opacity(0.1), radius: 2, x: 0.5, y: 1)
    }
}
