//
//  ResultVC.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/3/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit
import Lottie

class ResultVC: UIViewController {
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var feedbackLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var AVView: AnimationView!
    var scre:Int = 0
    var totalQuestions: Int = 0
    let animationDuration: Double = 0.8
    let animationStartDate = Date()
    let startValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
    }
    
    @objc func handleUpdate() {
        let now = Date()
        let elapedTime = now.timeIntervalSince(animationStartDate)
        
        if elapedTime > animationDuration {
            resultLabel.text = "\(scre) / \(totalQuestions)"
        } else {
            let percentage = elapedTime / animationDuration
            let value = Double(startValue) + percentage * Double(scre - startValue)
            resultLabel.text = "\(Int(value)) / \(totalQuestions)"
            resultLabel.pulsate()
        }
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        if let destinationViewController = navigationController?.viewControllers.filter({$0.classForCoder == HomeVC.self}).first {
        navigationController?.popToViewController(destinationViewController, animated: true)
        }
    }
    
    @IBAction func restartButton(_ sender: Any) {
        if let destinationViewController = navigationController?.viewControllers.filter({$0.classForCoder == QuestionViewController.self}).first {
            navigationController?.popToViewController(destinationViewController, animated: true)
        }
    }
    
    
    
    func setupUI() {
        // Set up Mins and Secs Label
        let minutes = "\(String(format: "%02d", counter / 60)) Min"
        let seconds = "\(String(format: "%02d", counter % 60)) Sec"
        
        if minutes == "00 Min" {
            timerLabel.text = "\(seconds)"
        } else {
            timerLabel.text = "\(minutes) \(seconds)"
        }
        
        //Update Feedback label depending on score
        if scre >= 8 {
            feedbackLabel.text = "Great job on the quiz, keep it up!"
        } else {
            feedbackLabel.text = "Keep studying, try the quiz again!"
        }
    
        // Done animation
        let doneAnimation =  AnimationView(name: "676-done")
        AVView.contentMode = .scaleAspectFit
        self.AVView.addSubview(doneAnimation)
        doneAnimation.frame = self.AVView.bounds
        doneAnimation.loopMode = .loop
        doneAnimation.play()
        
        //Adding shadow to buttons
        addShadowButton(button: restartButton)
        addShadowButton(button: homeButton)
    }
    
}
