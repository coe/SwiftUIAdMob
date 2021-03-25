//
//  ContainedAdView.swift
//  SwiftUIAdMob
//
//  Created by 日向 強 on 2021/03/25.
//

import Foundation
import SwiftUI
import UIKit

struct ContainedAdViewController<Content: View>: UIViewControllerRepresentable {
    let rootView: Content

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let adViewController: AdViewController = UIStoryboard(name: "AdViewController", bundle: nil).instantiateInitialViewController()!
        adViewController.rootView = AnyView(rootView)
        return adViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
    class Coordinator: NSObject {
        var parent: ContainedAdViewController
        
        init(_ containedAdViewController: ContainedAdViewController) {
            parent = containedAdViewController
        }
    }
}
