//
//  MainView.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 07/04/2023.
//


import SwiftUI

struct MainView: View {
    @StateObject var products = ProductsListObject()
    @StateObject var cartItems = CartViewModel()
    @StateObject var user = UserViewModel()
    @AppStorage("paging") var paging: Int = 0
    var body: some View {
        TabView{
            HomeView(productsList: products, user: user).environmentObject(cartItems)
                .tabItem {
                    Image(systemName:"house")
                    Text("Home")
                }
            CartView(cartProducts: cartItems)
                .environmentObject(user)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            ProfilView()
                .environmentObject(user)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
        }
        .zIndex(10)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
