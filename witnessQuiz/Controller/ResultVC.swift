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

    @IBOutlet var restartButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var feedbackLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var AVView: AnimationView!
    var scre:Int = 0
    var totalQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        if scre <= 12 {
            feedbackLabel.text = "Keep studying, try the quiz again!"
        } else {
            feedbackLabel.text = "Great job on the quiz, keep it up!"
        }
        
        resultLabel.text = "\(scre) / \(totalQuestions)"
        
        // Done animation
        let doneAnimation =  AnimationView(name: "676-done")
        AVView.contentMode = .scaleAspectFit
        self.AVView.addSubview(doneAnimation)
        doneAnimation.frame = self.AVView.bounds
        doneAnimation.loopMode = .loop
        doneAnimation.play()
        
        //Restart Button UI
        restartButton.layer.shadowColor = UIColor.gray.cgColor
        restartButton.layer.shadowRadius = 5
        restartButton.layer.shadowOpacity = 4
        restartButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    @IBAction func restartButton(_ sender: Any) {
        if let destinationViewController = navigationController?.viewControllers.filter({$0.classForCoder == QuestionViewController.self}).first {
        navigationController?.popToViewController(destinationViewController, animated: true)
        }
    }
    
}
