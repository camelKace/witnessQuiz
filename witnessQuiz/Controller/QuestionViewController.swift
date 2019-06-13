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
    @IBOutlet var choiceA: UIButton!
    @IBOutlet var choiceB: UIButton!
    @IBOutlet var choiceC: UIButton!
    @IBOutlet var choiceD: UIButton!
    @IBOutlet var nextButton: UIButton!
    var questionBank: [Question]?
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var alertText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        restartQuiz()
        navigationController?.navigationBar.topItem?.title = ""
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
    func alertQuestionAnswer() {
        
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        settingUpAnimations(sender: sender)
        switch selectedAnswer {
        case 1:
            choiceA.backgroundColor = greenColor
            choiceA.flash()
            choiceB.backgroundColor = red
            choiceC.backgroundColor = red
            choiceD.backgroundColor = red
            choiceB.isEnabled = false
            choiceC.isEnabled = false
            choiceD.isEnabled = false
            choiceA.isEnabled = false
            nextButton.pulsate()
            alertQuestionAnswer()
        case 2:
            choiceB.backgroundColor = greenColor
            choiceB.flash()
            choiceA.backgroundColor = red
            choiceC.backgroundColor = red
            choiceD.backgroundColor = red
            choiceA.isEnabled = false
            choiceC.isEnabled = false
            choiceD.isEnabled = false
            choiceB.isEnabled = false
            nextButton.pulsate()
        case 3:
            choiceC.backgroundColor = greenColor
            choiceC.flash()
            choiceB.backgroundColor = red
            choiceA.backgroundColor = red
            choiceD.backgroundColor = red
            choiceB.isEnabled = false
            choiceA.isEnabled = false
            choiceD.isEnabled = false
            choiceC.isEnabled = false
            nextButton.pulsate()
        case 4:
            choiceD.backgroundColor = greenColor
            choiceD.flash()
            choiceB.backgroundColor = red
            choiceC.backgroundColor = red
            choiceA.backgroundColor = red
            choiceB.isEnabled = false
            choiceC.isEnabled = false
            choiceA.isEnabled = false
            choiceD.isEnabled = false
            nextButton.pulsate()
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
            choiceA.setTitle(arrayOfQuestions[questionNumber].optionA, for: .normal)
            choiceB.setTitle(arrayOfQuestions[questionNumber].optionB, for: .normal)
            choiceC.setTitle(arrayOfQuestions[questionNumber].optionC, for: .normal)
            choiceD.setTitle(arrayOfQuestions[questionNumber].optionD, for: .normal)
            selectedAnswer = arrayOfQuestions[questionNumber].correctAnswer
            choiceA.backgroundColor = buttonColor
            choiceB.backgroundColor = buttonColor
            choiceC.backgroundColor = buttonColor
            choiceD.backgroundColor = buttonColor
            choiceA.isEnabled = true
            choiceB.isEnabled = true
            choiceC.isEnabled = true
            choiceD.isEnabled = true
            //TODO make backing alerts
  //          alertText = arrayOfQuestions[questionNumber].
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
        
        nextButton.layer.removeAllAnimations()
        choiceA.layer.removeAllAnimations()
        choiceB.layer.removeAllAnimations()
        choiceC.layer.removeAllAnimations()
        choiceD.layer.removeAllAnimations()
        
        addShadowButton(button: choiceA)
        addShadowButton(button: choiceB)
        addShadowButton(button: choiceC)
        addShadowButton(button: choiceD)
        addShadowButton(button: nextButton)
    }

    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        nextButton.setTitle("Next", for: .normal)
    }
    
}
