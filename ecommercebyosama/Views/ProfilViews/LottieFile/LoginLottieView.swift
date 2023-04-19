//
//  LoginLottieView.swift
//  ecommercebyosama
//
//  Created by Osama Mohamed on 10/04/2023.
//

import SwiftUI
import Lottie

struct LoginLottieView: UIViewRepresentable {
    
    var animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LoginLottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = LottieAnimation.named("shoppingCart")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([ animationView.heightAnchor.constraint(equalTo: view.heightAnchor), animationView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        return view
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LoginLottieView>) {
        
    }
}

