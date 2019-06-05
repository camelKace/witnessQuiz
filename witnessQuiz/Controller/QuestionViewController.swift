//
//  ViewController.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/2/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit
import Lottie

var timer = Timer()
var isRunning = false
var counter = 0
extension UINavigationController {
    func hideShadow(){
        self.navigationBar.setValue(true, forKey: "hidesShadow")
    }
}
class QuestionViewController: UIViewController {
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var animationV2: AnimationView!
    @IBOutlet var animationView: AnimationView!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choseA: UIButton!
    @IBOutlet weak var choseB: UIButton!
    @IBOutlet weak var choseC: UIButton!
    @IBOutlet weak var choseD: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        restartQuiz()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.hideShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restartQuiz()
        setUpTimer()
    }
    func setUpTimer() {
        counter = 0
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
    counter += 1
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        settingUpAnimations(sender: sender)
        switch selectedAnswer {
        case 1:
            choseA.backgroundColor = dukeGreenColor
            choseB.backgroundColor = dukeRed
            choseC.backgroundColor = dukeRed
            choseD.backgroundColor = dukeRed
            choseB.isEnabled = false
            choseC.isEnabled = false
            choseD.isEnabled = false
            choseA.isEnabled = false
        case 2:
            choseB.backgroundColor = dukeGreenColor
            choseA.backgroundColor = dukeRed
            choseC.backgroundColor = dukeRed
            choseD.backgroundColor = dukeRed
            choseA.isEnabled = false
            choseC.isEnabled = false
            choseD.isEnabled = false
            choseB.isEnabled = false
        case 3:
            choseC.backgroundColor = dukeGreenColor
            choseB.backgroundColor = dukeRed
            choseA.backgroundColor = dukeRed
            choseD.backgroundColor = dukeRed
            choseB.isEnabled = false
            choseA.isEnabled = false
            choseD.isEnabled = false
            choseC.isEnabled = false
        case 4:
            choseD.backgroundColor = dukeGreenColor
            choseB.backgroundColor = dukeRed
            choseC.backgroundColor = dukeRed
            choseA.backgroundColor = dukeRed
            choseB.isEnabled = false
            choseC.isEnabled = false
            choseA.isEnabled = false
            choseD.isEnabled = false
        default:
            print("Unknown")
        }
    }
    
    func settingUpAnimations(sender: UIButton) {
        if sender.tag == selectedAnswer {
            let thumbsUpAnimation =  AnimationView(name: "2393-green-like")
            thumbsUpAnimation.contentMode = .scaleAspectFit
            self.animationView.addSubview(thumbsUpAnimation)
            thumbsUpAnimation.frame = self.animationView.bounds
            animationView.alpha = 1
            thumbsUpAnimation.play()
            score += 1
        } else {
            let dislikeAnimation =  AnimationView(name: "2394-dislike")
            dislikeAnimation.contentMode = .scaleAspectFit
            self.animationV2.addSubview(dislikeAnimation)
            dislikeAnimation.frame = self.animationV2.bounds
            animationV2.alpha = 1
            dislikeAnimation.play()
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        questionNumber += 1
        updateQuestion()
        sendToResults()
    }
    
    func sendToResults() {
        //Send to ResultsVC if quiz reaches last question
        if questionNumber == allQuestions.list.count {
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Result") as? ResultVC {
                timer.invalidate()
                isRunning = false
                viewController.scre = score
                viewController.totalQuestions = allQuestions.list.count
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
    func updateQuestion() {
        if questionNumber <= allQuestions.list.count - 1{
            
            questionLabel.text = allQuestions.shuffled[questionNumber].question
            choseA.setTitle(allQuestions.shuffled[questionNumber].optionA, for: .normal)
            choseB.setTitle(allQuestions.shuffled[questionNumber].optionB, for: .normal)
            choseC.setTitle(allQuestions.shuffled[questionNumber].optionC, for: .normal)
            choseD.setTitle(allQuestions.shuffled[questionNumber].optionD, for: .normal)
            selectedAnswer = allQuestions.shuffled[questionNumber].correctAnswer
            choseA.backgroundColor = buttonColor
            choseB.backgroundColor = buttonColor
            choseC.backgroundColor = buttonColor
            choseD.backgroundColor = buttonColor
            choseA.isEnabled = true
            choseB.isEnabled = true
            choseC.isEnabled = true
            choseD.isEnabled = true
        }
        updateUI()
    }
    
    func updateUI() {
        
        //Update Score Label
        scoreLabel.text = "Score: \(score)"
        
        //Update Question Number Label
        if questionNumber != allQuestions.list.count {
            questionCounter.text = "\(questionNumber + 1) / \(allQuestions.list.count)"
        }
        
        //Update Progress View
        UIView.animate(withDuration: 0.25, animations: {
            self.progressView.frame.size.width = (self.view.frame.width / CGFloat(self.allQuestions.list.count)) * CGFloat(self.questionNumber + 1)
        self.progressView.layoutIfNeeded()
        })
        
        // Update Button UI
        if questionNumber == allQuestions.list.count - 1 {
            nextButton.setTitle("Finish Quiz", for: .normal)
        }
        addShadow()
        
        //Hide Animation Views
        animationView.alpha = 0
        animationV2.alpha = 0
    }
    
    func addShadow() {
        choseA.layer.shadowColor = UIColor.gray.cgColor
        choseA.layer.shadowRadius = 5
        choseA.layer.shadowOpacity = 4
        choseA.layer.shadowOffset = CGSize(width: 0, height: 0)
        choseB.layer.shadowColor = UIColor.gray.cgColor
        choseB.layer.shadowRadius = 5
        choseB.layer.shadowOpacity = 4
        choseB.layer.shadowOffset = CGSize(width: 0, height: 0)
        choseC.layer.shadowColor = UIColor.gray.cgColor
        choseC.layer.shadowRadius = 5
        choseC.layer.shadowOpacity = 4
        choseC.layer.shadowOffset = CGSize(width: 0, height: 0)
        choseD.layer.shadowColor = UIColor.gray.cgColor
        choseD.layer.shadowRadius = 5
        choseD.layer.shadowOpacity = 4
        choseD.layer.shadowOffset = CGSize(width: 0, height: 0)
        nextButton.layer.shadowColor = UIColor.gray.cgColor
        nextButton.layer.shadowRadius = 5
        nextButton.layer.shadowOpacity = 4
        nextButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        nextButton.setTitle("Next", for: .normal)
    }
    
}
