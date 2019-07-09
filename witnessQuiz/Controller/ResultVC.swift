//
//  ResultVC.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/3/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit
import Lottie

final class ResultVC: UIViewController {
    
    var questions: [Question]?
    var scre:Int = 0
    var totalQuestions: Int = 0
    let animationDuration: Double = 0.8
    let animationStartDate = Date()
    let startValue = 0
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var feedbackLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var AVView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpCounter()
    }
    
    func setUpCounter() {
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
    
    func setupUI() {
        setUpDurationLabel()
        setUpFeedbackLabel()
        setUpDoneAnimation()
    }
    
    func setUpDurationLabel() {
        let minutes = "\(String(format: "%02d", counter / 60)) Min"
        let seconds = "\(String(format: "%02d", counter % 60)) Sec"
        
        if minutes == "00 Min" {
            timerLabel.text = "\(seconds)"
        } else {
            timerLabel.text = "\(minutes) \(seconds)"
        }
    }
    
    func setUpFeedbackLabel() {
        if scre >= 8 {
            feedbackLabel.text = "Great job, keep it up!"
        } else {
            feedbackLabel.text = "Keep going, try again!"
        }
    }
    
    func setUpDoneAnimation() {
        let doneAnimation =  AnimationView(name: "676-done")
        AVView.contentMode = .scaleAspectFit
        self.AVView.addSubview(doneAnimation)
        doneAnimation.frame = self.AVView.bounds
        doneAnimation.loopMode = .loop
        doneAnimation.play()
    }
}
