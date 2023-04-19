//
//  ProductListViewModel.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 11/04/2023.
//
import Foundation

class  ProductsListObject: ObservableObject {
    @Published var products: [Product]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    var featuredProduct : [Product] {
        var fProducts: [Product] = []
        if let products = self.products  {
            if products.count >= 4 {
            fProducts = products[0...3].shuffled()
            }
        }
        return fProducts
    }
    

    private let productListServices: APIServicesProtocol
    
    init(productServices: APIServicesProtocol = APIServices.shared){
        self.productListServices = productServices
    }
    
    func loadProducts(with url: ProductListEndpoint){
        self.products = nil
        DispatchQueue.main.async {
            self.isLoading = true
        }
        productListServices.fetchProducts(from: url) { (result) in
            DispatchQueue.main.async {
                self.isLoading = true
            }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error as NSError
                    print(error.localizedDescription)
                }
            }
        }
    }
}
