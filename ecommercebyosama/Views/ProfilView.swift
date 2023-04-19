//
//  ProfilView.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 09/04/2023.
//

import SwiftUI

struct ProfilView: View {
    @EnvironmentObject var userVM: UserViewModel
    @StateObject var imageLoader = ImageLoader()
    var body: some View {
        ZStack {
            VStack{
                if let user = userVM.user{
                    LoggedInView(user: user.results[0])
                        .environmentObject(userVM)
                } else {
                    LoginView().environmentObject(userVM)
                }
            }
            if userVM.isLoading{
                ZStack{
                    Color.background.edgesIgnoringSafeArea(.all)
                    ProductLoading()
                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
            .environmentObject(UserViewModel())
    }
}
