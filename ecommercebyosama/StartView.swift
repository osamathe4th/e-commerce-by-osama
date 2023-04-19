//
//  StartView.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 09/04/2023.
//

import SwiftUI

struct StartView: View {
    @AppStorage("paging") var paging:Int = 0
    var body: some View {
      
        ZStack{
            Image("cc20")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            VStack{
              Image("ff22")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300,height: 50,alignment: .center)
               Image("oo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 50,alignment: .center)
                    
                Button { 
                    paging = 1
                        
                } label: {
                    Text("Start")
                        .foregroundColor(.black)
                        .frame(width: 250,height: 50,alignment: .center)
                        .background(Color("White"))
                        .cornerRadius(20)
                        
                }

            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
