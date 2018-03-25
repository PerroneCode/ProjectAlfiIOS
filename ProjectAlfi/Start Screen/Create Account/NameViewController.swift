//
//  EmailAddressViewController.swift
//  SeroundIOS
//
//  Created by Luis Perrone on 5/22/17.
//  Copyright © 2017 Seround. All rights reserved.
//

import UIKit
import AVFoundation

class NameViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ErrorSound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    var currentColor = 0

    @IBAction func buttonAction(_ sender: Any) {
        
        let result = checkValid()
        
        if(result == Constants.PROCESS_SUCCESS) {
            
            let createProfileViewController: CreateProfileViewController =
                UIStoryboard.viewController(identifier: "createProfileViewController") as! CreateProfileViewController
            createProfileViewController.currentColor = self.currentColor
            createProfileViewController.firstNameString = firstName.text!
            createProfileViewController.lastNameString = lastName.text!
            self.navigationController?.pushViewController(createProfileViewController, animated: true)
            
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
        firstName.becomeFirstResponder()
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        if (errorLabel.alpha != 0.0) {
            if(textField == firstName && (textField.text?.characters.count)! > 0) {
                errorLabel.alpha = 0.0
            } else if (textField == self.lastName && (lastName.text?.characters.count)! > 0) {
                errorLabel.alpha = 0.0
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == self.firstName) {
            textField.resignFirstResponder()
            lastName.becomeFirstResponder()
        } else {
            let result = checkValid()
            
            if(result == Constants.PROCESS_SUCCESS) {
                
                let createProfileViewController: CreateProfileViewController =
                    UIStoryboard.viewController(identifier: "createProfileViewController") as! CreateProfileViewController
                createProfileViewController.currentColor = self.currentColor
                createProfileViewController.firstNameString = firstName.text!
                createProfileViewController.lastNameString = lastName.text!
                self.navigationController?.pushViewController(createProfileViewController, animated: true)
                
            } else {
                errorLabel.text = result
                errorLabel.alpha = 1.0
                audioPlayer.play()
            }
            
        }
        
        return true
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
        
//
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
       
        if(firstName.text!.characters.count == 0 && (lastName.text?.characters.count)! == 0) {
            result = Constants.CHECK_FIRST_AND_LAST_NAME
            self.firstName.attributedPlaceholder = NSAttributedString(string: "First Name",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
            self.lastName.attributedPlaceholder = NSAttributedString(string: "Last Name",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
        } else if (firstName.text!.characters.count == 0) {
            result = Constants.CHECK_FIRSTNAME_EMPTY
            self.firstName.attributedPlaceholder = NSAttributedString(string: "First Name",
                                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
        } else if (lastName.text?.characters.count == 0) {
            result = Constants.CHECK_LASTNAME_EMPTY
            self.lastName.attributedPlaceholder = NSAttributedString(string: "Last Name",
                                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
        }
        
        return result
    }
    
}


extension NameViewController {
    
    func prepareLayout() {
        
//        navigationItem.backButton.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        continueButton.backgroundColor = UIColorFromRGB(rgbValue: 0x38DE82)
        continueButton.layer.cornerRadius = continueButton.frame.height/2
        continueButton.layer.shadowColor = UIColorFromRGB(rgbValue: 0x212121).cgColor
        continueButton.layer.shadowOpacity = 0.3
        continueButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        continueButton.layer.shadowRadius = 3.0

        
        self.firstName.textAlignment = NSTextAlignment.center
        self.firstName.attributedPlaceholder = NSAttributedString(string: "First Name",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0x414141).withAlphaComponent(0.7)])
        self.firstName.textColor = UIColorFromRGB(rgbValue: 0x414141)
        self.lastName.textAlignment = NSTextAlignment.center
        self.lastName.attributedPlaceholder = NSAttributedString(string: "Last Name",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0x414141).withAlphaComponent(0.7)])
        self.lastName.textColor = UIColorFromRGB(rgbValue: 0x414141)
        firstName.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        lastName.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        
        firstName.addTarget(self, action: #selector(NameViewController.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        lastName.addTarget(self, action: #selector(NameViewController.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        firstName.delegate = self
        lastName.delegate = self
        
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
