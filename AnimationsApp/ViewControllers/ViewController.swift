//
//  ViewController.swift
//  AnimationsApp
//
//  Created by Roman Zhukov on 11.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var animationView: UIView!
    
    private var animationStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func runButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: [.autoreverse, .repeat]) {
            if !self.animationStarted {
                self.animationView.frame.origin.x -= 10
                self.animationStarted.toggle()
            }
                }
        
        
        
        sender.pulsate()
    }
    
}

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.9
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 1
        pulse.damping = 1
        
        layer.add(pulse, forKey: nil)
    }
}
