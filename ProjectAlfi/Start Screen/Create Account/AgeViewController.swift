//
//  EmailAddressViewController.swift
//  SeroundIOS
//
//  Created by Luis Perrone on 5/22/17.
//  Copyright © 2017 Seround. All rights reserved.
//

import UIKit
import AVFoundation

class AgeViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    var firstNameString = ""
    var lastNameString = ""
    var emailString = ""
    var passwordString = ""
    var sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ErrorSound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    var currentColor = 0
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let result = checkValid()
        
        if(result == Constants.PROCESS_SUCCESS) {
            
            let weightViewController: WeightViewController =
                UIStoryboard.viewController(identifier: "weightViewController") as! WeightViewController
            weightViewController.firstNameString = firstNameString
            weightViewController.lastNameString = lastNameString
            weightViewController.emailString = emailString
            weightViewController.passwordString = passwordString
            weightViewController.ageString = ageTextField.text!
            self.navigationController?.pushViewController(weightViewController, animated: true)
            
        } else {
            errorLabel.text = result
            errorLabel.alpha = 1.0
            audioPlayer.play()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        prepareAudioPlayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ageTextField.becomeFirstResponder()
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        if (errorLabel.alpha != 0.0) {
            if(textField == ageTextField && (textField.text?.characters.count)! > 0) {
                errorLabel.alpha = 0.0
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == self.ageTextField) {
            textField.resignFirstResponder()
        } else {
            let result = checkValid()
            
            if(result == Constants.PROCESS_SUCCESS) {
                
                let weightViewController: WeightViewController =
                    UIStoryboard.viewController(identifier: "weightViewController") as! WeightViewController
                weightViewController.firstNameString = firstNameString
                weightViewController.lastNameString = lastNameString
                weightViewController.emailString = emailString
                weightViewController.passwordString = passwordString
                weightViewController.ageString = ageTextField.text!
                self.navigationController?.pushViewController(weightViewController, animated: true)
                
            } else {
                errorLabel.text = result
                errorLabel.alpha = 1.0
                audioPlayer.play()
            }
            
        }
        
        return true
    }
    
    func buttonClicked(_ sender: AnyObject?) {
        
        
//        if sender === backButton {
//            UIApplication.shared.keyWindow?.endEditing(true)
//            //        self.navigationController?.isNavigationBarHidden = true
//            //        self.navigationController?.popViewController(animated: true)
//            //        performSegue(withIdentifier: "unwindToStart", sender: self)
//
//        }
    }
    
    func checkValid() -> String {
        
        var result = Constants.PROCESS_SUCCESS
        
        if(ageTextField.text!.characters.count == 0 ) {
            result = Constants.CHECK_AGE_EMPTY
            self.ageTextField.attributedPlaceholder = NSAttributedString(string: "Your Age",
                                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
        }
        
        return result
    }
    
}


extension AgeViewController {
    
    func prepareLayout() {
        
//        navigationItem.backButton.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        continueButton.backgroundColor = UIColorFromRGB(rgbValue: 0x38DE82)
        continueButton.layer.cornerRadius = 6
//        continueButton.layer.shadowColor = UIColorFromRGB(rgbValue: 0x212121).cgColor
//        continueButton.layer.shadowOpacity = 0.3
//        continueButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        continueButton.layer.shadowRadius = 3.0
        
        
        self.ageTextField.textAlignment = NSTextAlignment.center
        self.ageTextField.attributedPlaceholder = NSAttributedString(string: "Your Age",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0x414141).withAlphaComponent(0.7)])
        self.ageTextField.textColor = UIColorFromRGB(rgbValue: 0x414141)
       
        ageTextField.tintColor = UIColorFromRGB(rgbValue: 0x414141)
        
        ageTextField.addTarget(self, action: #selector(NameViewController.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        ageTextField.delegate = self
        
        //        setGradientBackground()
        
    }
    
    func prepareAudioPlayer() {
        
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
        } catch let error {
            print("error occured \(error)")
        }
        
        audioPlayer.prepareToPlay()
    }
    
}

