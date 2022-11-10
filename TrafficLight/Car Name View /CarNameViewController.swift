//
//  CarNameViewController.swift
//  TrafficLight
//
//  Created by Victor on 09.11.2022.
//

import UIKit

class CarNameViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var startDrivingBtn: UIButton!
    
    private var viewDelegate: CarNameViewDelegate!
    let presenter = CarNamePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setViewDelegate(self)
        
        startDrivingBtn.addTarget(self, action: #selector(startDrivingBtnDidTap), for: .touchUpInside)
        textView.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startDrivingBtn.isEnabled = false
        textView.text = ""
    }
    
    @objc func startDrivingBtnDidTap() {
        let controller = R.storyboard.trafficLightViewController.trafficLightViewController()!
        controller.car = presenter.car
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func handleTap() {
        textView.resignFirstResponder() // dismiss keyoard
    }
}

// MARK: - UITextFieldDelegate
extension CarNameViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        presenter.setCarName(name: textView.text)
    }
    
}

// MARK: - CarNameViewDelegate
extension CarNameViewController: CarNameViewDelegate {
    func isValidName(_ valid: Bool) {
        startDrivingBtn.isEnabled = valid
    }
    
}
