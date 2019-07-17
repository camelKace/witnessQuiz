//
//  ViewController.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/2/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit
import Lottie

final class QuestionViewController: UIViewController {
    
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
    @IBOutlet var nextButtonShadow: UIView!
    @IBOutlet var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartQuiz()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restartQuiz()
        setUpTimer()
 //       showServiceView()
    }
    @IBAction func homeButtonPressed(_ sender: Any) {
        if questionNumber >= 1 {
            let alert = UIAlertController(title: "Are you sure you want to navigate home?", message: "You will lose your progress on your current quiz.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.performSegue(withIdentifier: "home", sender: nil)
            }
            let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "home", sender: nil)
        }
        
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        questionNumber += 1
        updateQuestion()
        if questionNumber == questionBank?.count {
            performSegue(withIdentifier: "results", sender: nil)
            timer.invalidate()
            isRunning = false
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        answerAnimation(sender: sender)
        switch selectedAnswer {
        case 1:
            setupAnswersUI(correctButton: choiceA, wrongButtons: [choiceB,choiceC,choiceD])
        case 2:
            setupAnswersUI(correctButton: choiceB, wrongButtons: [choiceA, choiceC, choiceD])
        case 3:
            setupAnswersUI(correctButton: choiceC, wrongButtons: [choiceA, choiceB, choiceD])
        case 4:
            setupAnswersUI(correctButton: choiceD, wrongButtons: [choiceA, choiceB, choiceC])
        default:
            setupAnswersUI(correctButton: choiceA, wrongButtons: [choiceB,choiceC,choiceD])
        }
    }
    
//    func showServiceView() {
//        if isServiceView == true {
//            image.image = UIImage(named: "shadow")
//        }
//    }
    
    func setUpTimer() {
        counter = 0
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
    counter += 1
    }
    
    func setupAnswersUI(correctButton: UIButton, wrongButtons: [UIButton]) {
        for button in wrongButtons {
            button.backgroundColor = red
            button.backgroundColor = red
            button.backgroundColor = red
            button.isEnabled = false
            button.isEnabled = false
            button.isEnabled = false
        }
        correctButton.backgroundColor = greenColor
        correctButton.flash()
        correctButton.isEnabled = false
        nextButtonShadow.pulsing()
    }
    
    func answerAnimation(sender: UIButton) {
        if sender.tag == selectedAnswer {
            settingAnimations(animationString: "2393-green-like", animationView: thumbsUpView)
            score += 1
        } else {
            settingAnimations(animationString: "2394-dislike", animationView: thumbsDownView)
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
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
    
    func setQuestionAndAnswers(arrayOfQuestions: [Question]) {
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

    func updateQuestion() {
        if let questionBankCount = questionBank?.count {
            if questionNumber <= questionBankCount - 1 {
                if let questions = questionBank {
                    setQuestionAndAnswers(arrayOfQuestions: questions)
                } else {
                    print("questions value is nil")
                }
            }
        }
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        
        if questionNumber != questionBank?.count {
            if let questionBankCount = questionBank?.count {
                questionCounter.text = "\(questionNumber + 1) / \(questionBankCount)"
            }
        }
        
        if let questionBankCount = questionBank?.count {
            if questionNumber == questionBankCount - 1 {
                nextButton.setTitle("Finish Quiz", for: .normal)
            }
        }
        roundButton()
        updateProgressBarView()
        addShadow()
        removeAnimations()
    }
    
    func roundButton() {
        homeButton.layer.cornerRadius = homeButton.frame.width/2
        homeButton.layer.borderWidth = 1
        homeButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func updateProgressBarView() {
        UIView.animate(withDuration: 0.25, animations: {
            self.progressView.frame.size.width = (self.view.frame.width / CGFloat(10)) * CGFloat(self.questionNumber + 1)
            self.progressView.layoutIfNeeded()
        })
    }
    
    func addShadow() {
        addShadowButton(buttons: [choiceA, choiceB, choiceC, choiceD, homeButton])
    }
    
    func removeAnimations() {
        nextButtonShadow.layer.removeAllAnimations()
        choiceA.layer.removeAllAnimations()
        choiceB.layer.removeAllAnimations()
        choiceC.layer.removeAllAnimations()
        choiceD.layer.removeAllAnimations()
        thumbsDownView.alpha = 0
        thumbsUpView.alpha = 0
    }

    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        nextButton.setTitle("Next", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results" {
            guard let destination = segue.destination as? ResultVC else {
                fatalError("ERROR: destination is nil")
            }
            destination.scre = score
            if let questionBankCount = questionBank?.count {
                destination.totalQuestions = questionBankCount
            }
        }
    }
    
}
