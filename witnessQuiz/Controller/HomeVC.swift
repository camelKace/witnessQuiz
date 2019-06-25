//
//  HomeVC.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/18/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class HomeVC: UIViewController {
    
    var questions: [Question]?
    @IBOutlet var bibleTriviaButton: UIButton!
    @IBOutlet var questionFactoryButton: UIButton!
    @IBOutlet var bibleTriviaShadow: UIView!
    @IBOutlet var questionFactoryShadow: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        bibleTriviaShadow.pulsing()
        questionFactoryShadow.pulsing()
    }
    
    @IBAction func aboutMePressed(_ sender: UIButton) {
        openSafari(for: "https://camelKace.wixsite.com/mysite")
    }
    
    @IBAction func questionFactoryPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sending Suggestions", message: "Sending a question requires that you also send the answer to the question. The answer needs to have scriptural backing sent along with it.", preferredStyle: UIAlertController.Style.alert)
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
    
//    @IBAction func serviceModePressed(_ sender: UIButton) {
//        setQuestionBank(q: ServiceTrivia.init().shuffled)
//    }
 
    @objc func share(sender:UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIImage(named: "Untitled")
        UIGraphicsEndImageContext()
        
        let textToShare = "Check out SpirituallyFit on iOS!"
        
        if let myWebsite = URL(string: "https:apps.apple.com/app/id1468161128") {
            let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        }
        
    }
    
    func openSafari(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    func showMailError() {
        let alert = UIAlertController(title: "Could not send email", message: "Your device was not able to send email please try again.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
extension HomeVC: MFMailComposeViewControllerDelegate {
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

