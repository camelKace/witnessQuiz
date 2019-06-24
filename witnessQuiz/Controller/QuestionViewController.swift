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
    
    var questionBank: [Question]?
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var isServiceView: Bool?
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
    @IBOutlet var image: UIImageView!
    
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
        if isServiceView == true {
            image.image = UIImage(named: "shadow")
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        questionNumber += 1
        updateQuestion()
        sendToResults()
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
            setupAnswers(correct: choiceA, wrong: [choiceB,choiceC,choiceD])
        case 2:
            setupAnswers(correct: choiceB, wrong: [choiceA, choiceC, choiceD])
        case 3:
            setupAnswers(correct: choiceC, wrong: [choiceA, choiceB, choiceD])
        case 4:
            setupAnswers(correct: choiceD, wrong: [choiceA, choiceB, choiceC])
        default:
            setupAnswers(correct: choiceA, wrong: [choiceB,choiceC,choiceD])
        }
        
        if selectedAnswer != questionBank?[questionNumber].correctAnswer {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
    }
    
    func setupAnswers(correct: UIButton, wrong: [UIButton]) {
        correct.backgroundColor = greenColor
        correct.flash()
        correct.isEnabled = false
        for button in wrong {
            button.backgroundColor = red
            button.backgroundColor = red
            button.backgroundColor = red
            button.isEnabled = false
            button.isEnabled = false
            button.isEnabled = false
        }
        nextButton.pulsate()
    }
    
    func settingUpAnimations(sender: UIButton) {
        if sender.tag == selectedAnswer {
            settingAnimations(animationString: "2393-green-like", animationView: thumbsUpView)
            score += 1
        } else {
            settingAnimations(animationString: "2394-dislike", animationView: thumbsDownView)
        }
    }
    
    func settingAnimations(animationString: String, animationView: AnimationView!) {
        let animation =  AnimationView(name: animationString)
        animation.contentMode = .scaleAspectFit
        animationView.addSubview(animation)
        animation.frame = animationView.bounds
        animationView.alpha = 1
        animation.play()
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
