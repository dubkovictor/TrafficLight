//
//  UIView+TrafficLight.swift
//  TrafficLight
//
//  Created by Victor on 09.11.2022.
//

import UIKit

extension UIView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}
