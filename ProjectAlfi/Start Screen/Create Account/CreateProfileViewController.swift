//
//  EmailAddressViewController.swift
//  SeroundIOS
//
//  Created by Luis Perrone on 5/22/17.
//  Copyright © 2017 Seround. All rights reserved.
//

import UIKit
import AVFoundation

class CreateProfileViewController: BaseViewController, UITextFieldDelegate  {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var emailFormat = true
    var passwordFormat = true
    var sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ErrorSound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    var currentColor = 0
    var firstNameString = ""
    var lastNameString = ""
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let result = checkValid()
        if(result == Constants.PROCESS_SUCCESS) {
            
        findEmail()
            
        } else {
            audioPlayer.play()
            errorLabel.text = result
            errorLabel.alpha = 1.0
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        prepareAudioPlayer()
    }
    
    
    @objc func textFieldDidChange(textField: UITextField) {
        if textField == password {
            if !CommonUtils.isPasswordValid(password.text!) {
                errorLabel.text = Constants.CHECK_PASSWORD_FORMAT
                errorLabel.alpha = 1.0
            } else if !CommonUtils.containsWhiteSpaces(password.text!) {
                errorLabel.text = "Password must have no white spaces"
                errorLabel.alpha = 1.0
            } else {
                errorLabel.alpha = 0.0
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == self.email) {
            textField.resignFirstResponder()
            password.becomeFirstResponder()
        } else {
            let result = checkValid()
            if(result == Constants.PROCESS_SUCCESS) {
                
                findEmail()
                
            } else {
                audioPlayer.play()
                errorLabel.text = result
                errorLabel.alpha = 1.0
            }
        }
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        email.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func buttonClicked(_ sender: AnyObject?) {
        
        
//    if sender === backButton {
//        UIApplication.shared.keyWindow?.endEditing(true)
////        self.navigationController?.isNavigationBarHidden = true
////        self.navigationController?.popViewController(animated: true)
////        performSegue(withIdentifier: "unwindToStart", sender: self)
//
//        }
//    }

}
}


extension CreateProfileViewController {
    
    func prepareLayout() {
        
//        navigationItem.backButton.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        continueButton.backgroundColor = UIColorFromRGB(rgbValue: 0x38DE82)
        continueButton.layer.cornerRadius = 6
//        continueButton.layer.shadowColor = UIColorFromRGB(rgbValue: 0x212121).cgColor
//        continueButton.layer.shadowOpacity = 0.3
//        continueButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        continueButton.layer.shadowRadius = 3.0
        
        self.email.textAlignment = NSTextAlignment.center
        self.email.attributedPlaceholder = NSAttributedString(string: "Email address",
                                                         attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0x414141).withAlphaComponent(0.7)])
        self.email.textColor = UIColorFromRGB(rgbValue: 0x414141)
        self.password.textAlignment = NSTextAlignment.center
        self.password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                              attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0x414141).withAlphaComponent(0.7)])
        self.password.textColor = UIColorFromRGB(rgbValue: 0x414141)
        email.addTarget(self, action: #selector(CreateProfileViewController.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        password.addTarget(self, action: #selector(CreateProfileViewController.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        email.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        password.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        email.delegate = self
        password.delegate = self
        
//        setGradientBackground()

        
    }
    
    func findEmail() {
        
//        self.continueButton.loadingIndicator(true)
//        ApiFunctions.findEmail(email: email.text!, completion: { (message, res) in
//
//            if (res) {
//                self.continueButton.loadingIndicator(false)
                let ageViewController: AgeViewController =
                    UIStoryboard.viewController(identifier: "ageViewController") as! AgeViewController
                ageViewController.firstNameString = self.firstNameString
                ageViewController.lastNameString = self.lastNameString
                ageViewController.emailString = self.email.text!
                ageViewController.passwordString = self.password.text!
                
                self.navigationController?.pushViewController(ageViewController, animated: true)

//            } else {
//                self.continueButton.loadingIndicator(false)
//                self.errorLabel.text = message
//                self.errorLabel.alpha = 1.0
//                self.audioPlayer.play()
//            }
//
//        })
        
    }
    
    func prepareAudioPlayer() {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
        } catch let error {
            print("error occured \(error)")
        }
        
        audioPlayer.prepareToPlay()
    }
    
    func checkValid() -> String {
        
        var result = Constants.PROCESS_SUCCESS
        if email.text!.characters.count == 0{
            result = Constants.CHECK_EMAIL_EMPTY
            self.email.attributedPlaceholder = NSAttributedString(string: "Email address",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
        }
        else if !CommonUtils.isEmailValid(email.text!) {
            result = Constants.CHECK_EMAIL_INVALID
        }
        else if password.text?.characters.count == 0{
            result = Constants.CHECK_PASSWORD_EMPTY
            self.password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
        } else if !CommonUtils.isPasswordValid(password.text!) {
            result = Constants.CHECK_PASSWORD_FORMAT
        }
        return result
    }
    
}
