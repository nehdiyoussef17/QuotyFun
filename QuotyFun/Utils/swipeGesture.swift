//
//  swipeGesture.swift
//  QuotyFun
//
//  Created by odc on 14/2/2022.
//

import Foundation
import SwiftUI

struct swipeGesture : UIViewRepresentable {
    
    func makeCoordinator() -> swipeGesture.Coordiantor {
        return swipeGesture.Coordiantor()
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<swipeGesture>) -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        let left = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.left))
        left.direction = .left
        let right = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.right))
        right.direction = .right
        
        view.addGestureRecognizer(left)
        view.addGestureRecognizer(right)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<swipeGesture>) {
        
    }
    
    class Coordiantor : NSObject  {
        @objc func left(){
            print("left swipe")
        }
        @objc func right(){
            print("right swipe")
        }
    }
}
