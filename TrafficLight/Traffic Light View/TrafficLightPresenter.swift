//
//  TrafficLightPresenter.swift
//  TrafficLight
//
//  Created by Victor on 09.11.2022.
//

import Foundation

enum TrafficLight: Int {
    case red = 9
    case orange = 8
    case green = 4
    
    case non = 0
}

class TrafficLightPresenter: NSObject {
    
    private weak var viewDelegate: TrafficLightViewDelegate?
    
    var timer = Timer()
    var runCount = TrafficLight.green.rawValue
    
    var trafficLight = TrafficLight(rawValue: TrafficLight.non.rawValue)
    
    func setViewDelegate(_ delegate: TrafficLightViewDelegate) {
        viewDelegate = delegate
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            self.trafficLight = TrafficLight.init(rawValue: self.runCount)

            switch self.trafficLight {
                case .red:
                    self.viewDelegate?.setupLightsCondition(0)
                    self.runCount = TrafficLight.non.rawValue
                    break
                case .orange:
                    self.viewDelegate?.setupLightsCondition(1)
                    break
                case .green:
                    self.viewDelegate?.setupLightsCondition(2)
                    break
                default:
                    break
            }
            
            self.runCount += 1
            
            print("Timer tic! ", self.runCount)
        }
        
    }
    
    func invalidateTimer() {
        timer.invalidate()
    }
}
