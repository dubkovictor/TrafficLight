//
//  AppDelegate.swift
//  TrafficLight
//
//  Created by Victor on 08.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootViewController: RouteController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Added Route/Coordinate for easy app navigation
        setRoot(newRootController())
        return true
    }
    
    func newRootController() -> UIViewController {
        RouteController()
    }
    
    func setRoot(_ vc: UIViewController) {
        window?.rootViewController = vc
    }


}

