//
//  SplashVC.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/6/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit
import MessageUI

class SplashVC: UIViewController {
    var questions: [Question]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addShadow()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        questions = [Question]()
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
    
    func addShadow() {
//        startButton.layer.shadowColor = UIColor.gray.cgColor
//        startButton.layer.shadowRadius = 5
//        startButton.layer.shadowOpacity = 4
//        startButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    @IBAction func suggestQuestionPressed(_ sender: UIButton) {
        let mailComposerViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposerViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    
    func showMailError() {
        let alert = UIAlertController(title: "Could not send email", message: "Your device was not able to send email please try again.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
extension SplashVC: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            let alert = UIAlertController(title: "Could not send email", message: "Your device was not able to send email please try again.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .sent:
            let alert = UIAlertController(title: "Email Sent", message: "Your email has been sent, thank you for submiting a question.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .saved:
            let alert = UIAlertController(title: "Email Saved", message: "Your email has been saved.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func configureMailController () -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["witnessQuizApp@gmail.com"])
        mailComposerVC.setSubject("Question Suggestion")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
}
