//
//  SplashVC.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/6/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit


class TriviaLevelVC: UIViewController {
    var questions: [Question]?
    @IBOutlet var easyButton: UIButton!
    @IBOutlet var mediumButton: UIButton!
    @IBOutlet var hardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowButton(button: easyButton)
        addShadowButton(button: mediumButton)
        addShadowButton(button: hardButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questions = [Question]()
        easyButton.pulsate()
        mediumButton.pulsate()
        hardButton.pulsate()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.hideShadow()
        navigationController?.navigationBar.barTintColor = UIColor.white
    }

    func setQuestionBank(q: [Question]) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Question") as? QuestionViewController {
            questions = q
            viewController.questionBank = questions
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func levelButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            setQuestionBank(q: EasyQuestionBank.init().shuffled)
        case 2:
            setQuestionBank(q: MediumQuestionBank.init().shuffled)
        case 3:
            setQuestionBank(q: HardQuestionBank.init().shuffled)
        default:
         setQuestionBank(q: EasyQuestionBank.init().shuffled)
        }
    }
    
}
