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

class QuestionViewController: UIViewController {
    
    @IBOutlet var thumbsUpView: AnimationView!
    @IBOutlet var thumbsDownView: AnimationView!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choseA: UIButton!
    @IBOutlet weak var choseB: UIButton!
    @IBOutlet weak var choseC: UIButton!
    @IBOutlet weak var choseD: UIButton!
    @IBOutlet var nextButton: UIButton!
    var questionBank: [Question]?
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
            choseA.backgroundColor = greenColor
            choseB.backgroundColor = red
            choseC.backgroundColor = red
            choseD.backgroundColor = red
            choseB.isEnabled = false
            choseC.isEnabled = false
            choseD.isEnabled = false
            choseA.isEnabled = false
        case 2:
            choseB.backgroundColor = greenColor
            choseA.backgroundColor = red
            choseC.backgroundColor = red
            choseD.backgroundColor = red
            choseA.isEnabled = false
            choseC.isEnabled = false
            choseD.isEnabled = false
            choseB.isEnabled = false
        case 3:
            choseC.backgroundColor = greenColor
            choseB.backgroundColor = red
            choseA.backgroundColor = red
            choseD.backgroundColor = red
            choseB.isEnabled = false
            choseA.isEnabled = false
            choseD.isEnabled = false
            choseC.isEnabled = false
        case 4:
            choseD.backgroundColor = greenColor
            choseB.backgroundColor = red
            choseC.backgroundColor = red
            choseA.backgroundColor = red
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
            self.thumbsUpView.addSubview(thumbsUpAnimation)
            thumbsUpAnimation.frame = self.thumbsUpView.bounds
            thumbsUpView.alpha = 1
            thumbsUpAnimation.play()
            score += 1
        } else {
            let dislikeAnimation =  AnimationView(name: "2394-dislike")
            dislikeAnimation.contentMode = .scaleAspectFit
            self.thumbsDownView.addSubview(dislikeAnimation)
            dislikeAnimation.frame = self.thumbsDownView.bounds
            thumbsDownView.alpha = 1
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
        if questionNumber == 10 {
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Result") as? ResultVC {
                timer.invalidate()
                isRunning = false
                viewController.scre = score
                viewController.totalQuestions = 10
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
    func updateQuestion() {
        func switchQuestionBank(arrayOfQuestions: [Question]) {
            questionLabel.text = arrayOfQuestions[questionNumber].question
            choseA.setTitle(arrayOfQuestions[questionNumber].optionA, for: .normal)
            choseB.setTitle(arrayOfQuestions[questionNumber].optionB, for: .normal)
            choseC.setTitle(arrayOfQuestions[questionNumber].optionC, for: .normal)
            choseD.setTitle(arrayOfQuestions[questionNumber].optionD, for: .normal)
            selectedAnswer = arrayOfQuestions[questionNumber].correctAnswer
            choseA.backgroundColor = buttonColor
            choseB.backgroundColor = buttonColor
            choseC.backgroundColor = buttonColor
            choseD.backgroundColor = buttonColor
            choseA.isEnabled = true
            choseB.isEnabled = true
            choseC.isEnabled = true
            choseD.isEnabled = true
        }
        
        if questionNumber <= 10 - 1{
            switchQuestionBank(arrayOfQuestions: questionBank!)
        }
        
        updateUI()
    }
    
    func updateUI() {
        //Update Score Label
        scoreLabel.text = "Score: \(score)"
        
        //Update Question Number Label
        if questionNumber != 10 {
            questionCounter.text = "\(questionNumber + 1) / \(10)"
        }
        
        //Update Progress View
        UIView.animate(withDuration: 0.25, animations: {
            self.progressView.frame.size.width = (self.view.frame.width / CGFloat(10)) * CGFloat(self.questionNumber + 1)
        self.progressView.layoutIfNeeded()
        })
        
        // Update Button UI
        if questionNumber == 10 - 1 {
            nextButton.setTitle("Finish Quiz", for: .normal)
        }
        
        //Hide Animation Views
        thumbsDownView.alpha = 0
        thumbsUpView.alpha = 0
        
        addShadowButton(button: choseA)
        addShadowButton(button: choseB)
        addShadowButton(button: choseC)
        addShadowButton(button: choseD)
        addShadowButton(button: nextButton)
    }

    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        nextButton.setTitle("Next", for: .normal)
    }
    
}
