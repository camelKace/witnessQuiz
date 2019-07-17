//
//  SplashVC.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/6/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit

final class TriviaLevelVC: UIViewController {
    
    @IBOutlet var easyButton: UIButton!
    @IBOutlet var mediumButton: UIButton!
    @IBOutlet var hardButton: UIButton!
    @IBOutlet var buttonShadow: UIView!
    @IBOutlet var hardShadow: UIView!
    @IBOutlet var mediumShadow: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pulsateViews(views: [buttonShadow, mediumShadow, hardShadow])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "easy":
            guard let destination = segue.destination as? QuestionViewController else {
                fatalError("ERROR: destination is nil")
            }
            destination.questionBank = EasyQuestionBank.init().shuffled
        case "medium":
            guard let destination = segue.destination as? QuestionViewController else {
                fatalError("ERROR: destination is nil")
            }
            destination.questionBank = MediumQuestionBank.init().shuffled
        case "hard":
            guard let destination = segue.destination as? QuestionViewController else {
                fatalError("ERROR: destination is nil")
            }
            destination.questionBank = HardQuestionBank.init().shuffled
        default:
            guard let destination = segue.destination as? QuestionViewController else {
                fatalError("ERROR: destination is nil")
            }
            destination.questionBank = EasyQuestionBank.init().shuffled
        }
    }
    
}

