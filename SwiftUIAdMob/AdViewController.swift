//
//  AdViewController.swift
//  SwiftUIAdMob
//
//  Created by 日向 強 on 2021/03/25.
//

import UIKit
import SwiftUI
import GoogleMobileAds

class AdViewController: UIViewController {
    
    var rootView: AnyView!
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var bannerWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var bannerHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2435281174"
        bannerView.rootViewController = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadBannerAd()
    }
    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            self.loadBannerAd()
        })
    }
    
    
    func loadBannerAd() {
        let frame = { () -> CGRect in
            if #available(iOS 11.0, *) {
                return view.frame.inset(by: view.safeAreaInsets)
            } else {
                return view.frame
            }
        }()
        let viewWidth = frame.size.width
        let size = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        bannerWidthConstraint.constant = size.size.width
        bannerHeightConstraint.constant = size.size.height
        bannerView.adSize = size
        let request = GADRequest()
        request.scene = view.window?.windowScene
        bannerView.load(request)
    }
    
    @IBSegueAction func embedHostingController(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: rootView)
    }
}
