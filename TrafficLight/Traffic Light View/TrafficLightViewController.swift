//
//  TrafficLightViewController.swift
//  TrafficLight
//
//  Created by Victor on 09.11.2022.
//

import UIKit

class TrafficLightViewController: UIViewController {
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    private var viewDelegate: TrafficLightViewDelegate!
    
    let presenter = TrafficLightPresenter()
    
    var car: Car = Car(carName: "")
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter.invalidateTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setViewDelegate(self)
            
        carName.text = car.carName
        
        setupLightViews()
        
        lightsCondition(2)
        
        presenter.startTimer()
    }
    
    func setupLightViews() {
        stackView.subviews.enumerated().forEach({ (_, view) in
            view.setRounded()
        })
    }
    
    func lightsCondition(_ indexLights: Int) {
        stackView.subviews.enumerated().forEach({ (index, view) in
            if indexLights == index {
                view.alpha = 1
            } else {
                view.alpha = 0.2
            }
        })
    }
    
}

extension TrafficLightViewController: TrafficLightViewDelegate {
    func setupLightsCondition(_ indexLights: Int) {
        lightsCondition(indexLights)
    }
    
}
