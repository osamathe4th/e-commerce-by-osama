//
//  UserViewModel.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 11/04/2023.
//
import SwiftUI

class  UserViewModel: ObservableObject {
    @Published var user: UserAPIResults?
    @Published var isLoading = false
    @Published var error: NSError?
    @Published var isLoggedin = false
    @Published var login = "osama@osama.com"
    @Published var password = "osama"
    @Published var isNameValid: Bool? = nil
    @Published var isPasswordValid: Bool? = nil
    
    private let userServices: APIServicesProtocol
    
    init(userServices: APIServicesProtocol = APIServices.shared){
        self.userServices = userServices
    }
    

    func loadUser(){
        
        self.user = nil

        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        userServices.fetchUser { (result) in
            DispatchQueue.main.async {
                self.isLoading = true
            }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.user = response
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                    self.error = error as NSError
                }
            }
        }
    }
  
    func signout(){
        isLoading = true
        isNameValid = nil
        isPasswordValid = nil
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.user = nil
            self.isLoading = false
        }
    }
  
    func validateName(name: String){
        guard name.count > 5 && name.count < 24 else {
            withAnimation{
                isNameValid = false
            }
            return
        }
        guard name.contains("@") else {
            withAnimation{
                isNameValid = false
            }
            return
        }
        withAnimation{
            isNameValid = true
        }
    }
   
    func validatePassword(name: String){
        guard name.count >= 5 && name.count < 24 else {
            withAnimation{
                isPasswordValid = false
            }
            return
        }
        withAnimation{
            isPasswordValid = true
        }
    }
}
