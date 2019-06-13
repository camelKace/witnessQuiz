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

    @IBAction func suggestQuestionPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sending Suggestions", message: "Emailing a question requires that you also send the answer to the question. The answer needs to have backing sent along with it from the scriptures or Society publications.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            let mailComposerViewController = self.configureMailController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposerViewController, animated: true, completion: nil)
            } else {
                self.showMailError()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
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
            controller.dismiss(animated: true)
        case .failed:
            let alert = UIAlertController(title: "Could not send email", message: "Your device was not able to send email please try again.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            controller.dismiss(animated: true)
        case .sent:
            let alert = UIAlertController(title: "Email Sent", message: "Your email has been sent, thank you for submiting a question.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            controller.dismiss(animated: true)
        case .saved:
            let alert = UIAlertController(title: "Email Saved", message: "Your email has been saved.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            controller.dismiss(animated: true)
        }
    }
    
    func configureMailController () -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["SpirituallyFitApp@gmail.com"])
        mailComposerVC.setSubject("Question Suggestion")
        mailComposerVC.setMessageBody("Question: \nAnswer: \nBacking:", isHTML: false)
        
        return mailComposerVC
    }
}
