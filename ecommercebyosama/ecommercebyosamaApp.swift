//
//  ecommercebyosamaApp.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 07/04/2023.
//

import SwiftUI

@main
struct ecommercebyosamaApp: App {
    @AppStorage("paging") var paging: Int = 0
    init() {
        paging = 0
    }
    var body: some Scene {
        WindowGroup {
            if paging == 0 {
                StartView()
            }
            else if paging == 1 {
                MainView()
            }
          
            
        }
    }
}
