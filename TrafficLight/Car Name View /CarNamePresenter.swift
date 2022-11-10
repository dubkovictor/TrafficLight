//
//  CarNamePresenter.swift
//  TrafficLight
//
//  Created by Victor on 09.11.2022.
//
import Foundation

class CarNamePresenter: NSObject {
    
    private weak var viewDelegate: CarNameViewDelegate?
    
    var car: Car = Car(carName: "")
    
    func setViewDelegate(_ delegate: CarNameViewDelegate) {
        viewDelegate = delegate
    }
    
    func setCarName(name: String) {
        let nameStr = name.replacingOccurrences(of: " ", with: "")
        validName(name: nameStr)
        car.carName = nameStr
    }
    
    func validName(name: String) {
        if name.count > 2 {
            viewDelegate?.isValidName(true)
        } else {
            viewDelegate?.isValidName(false)
        }
    }
}
