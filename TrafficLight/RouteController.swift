//
//  RouteController.swift
//  TrafficLight
//
//  Created by Victor on 09.11.2022.
//

import UIKit

func doAfter(_ delay: TimeInterval? = nil, _ closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + (delay ?? 0), execute: closure)
}

final class RouteController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStartViewController()
    }
    
    func showStartViewController() {
        doAfter {
            let controller = R.storyboard.carNameViewController.carNameViewController()!
            let navigation = UINavigationController(rootViewController: controller)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: false)
        }
    }
    
}
