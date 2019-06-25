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
    @IBOutlet var nextButtonShadow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartQuiz()
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
        if questionNumber == 10 {
            performSegue(withIdentifier: "results", sender: nil)
            timer.invalidate()
            isRunning = false
        }
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
        resultUI(sender: sender)
        switch selectedAnswer {
        case 1:
            setupAnswersUI(correct: choiceA, wrong: [choiceB,choiceC,choiceD])
        case 2:
            setupAnswersUI(correct: choiceB, wrong: [choiceA, choiceC, choiceD])
        case 3:
            setupAnswersUI(correct: choiceC, wrong: [choiceA, choiceB, choiceD])
        case 4:
            setupAnswersUI(correct: choiceD, wrong: [choiceA, choiceB, choiceC])
        default:
            setupAnswersUI(correct: choiceA, wrong: [choiceB,choiceC,choiceD])
        }
    }
    
    func setupAnswersUI(correct: UIButton, wrong: [UIButton]) {
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
        nextButtonShadow.pulsing()
    }
    
    func resultUI(sender: UIButton) {
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
            if let questions = questionBank {
                switchQuestionBank(arrayOfQuestions: questions)
            } else {
                print("questions value is nil")
            }
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
        
        nextButtonShadow.layer.removeAllAnimations()
        choiceA.layer.removeAllAnimations()
        choiceB.layer.removeAllAnimations()
        choiceC.layer.removeAllAnimations()
        choiceD.layer.removeAllAnimations()
        
        addShadowButton(button: choiceA)
        addShadowButton(button: choiceB)
        addShadowButton(button: choiceC)
        addShadowButton(button: choiceD)
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
            destination.totalQuestions = 10
        }
    }

    
}
