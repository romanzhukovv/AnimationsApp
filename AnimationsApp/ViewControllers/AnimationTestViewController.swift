//
//  ViewController.swift
//  AnimationsApp
//
//  Created by Roman Zhukov on 11.01.2022.
//

import Spring

class AnimationTestViewController: UIViewController {
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet var parametersLabel: UILabel!
    
    private var currentAnimation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimationParameters()
    }

    @IBAction func runButton(_ sender: SpringButton) {
        runAnimation()
        showAnimationParameters()
        
        let nextAnimation = Animation.getRandomAnimation()
        currentAnimation = nextAnimation
    
        sender.setTitle("Run \(nextAnimation.preset)", for: .normal)
    }
}

extension AnimationTestViewController {
    private func runAnimation() {
        animationView.animation = currentAnimation.preset
        animationView.curve = currentAnimation.curve
        animationView.force = currentAnimation.force
        animationView.duration = currentAnimation.duration
        animationView.delay = currentAnimation.delay
        animationView.animate()
    }
    
    private func showAnimationParameters () {
        parametersLabel.text = """
        preset: \(currentAnimation.preset)
        curve: \(currentAnimation.curve)
        force: \(String(format: "%.2f", currentAnimation.force))
        duration: \(String(format: "%.2f", currentAnimation.duration))
        delay: \(String(format: "%.2f", currentAnimation.delay))
        """
    }
}
