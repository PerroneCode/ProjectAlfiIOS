import UIKit
import AVFoundation

class LoginViewController: BaseViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var seroundLogo: UIImageView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var forgotUsernamePassword: UIButton!
    var keyboardShowing = true
    @IBOutlet weak var errorLabel: UILabel!
    var emailFormat = true
    var passwordFormat = true
    var sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "ErrorSound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    var currentColor = 0
    
    @IBAction func buttonAction(_ sender: Any) {
        
        login()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        prepareAudioPlayer()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField == self.email) {
//            textField.resignFirstResponder()
            password.becomeFirstResponder()
        } else {
            login()
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
    
    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self)
    }
    
}


extension LoginViewController {
    
//    func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if (keyboardShowing){
//                self.logInButton.y -= keyboardSize.height
//                self.forgotUsernamePassword.y -= keyboardSize.height
//                keyboardShowing = false
//            }
//        }
//    }
//    
//    func keyboardWillHide(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if (keyboardShowing) {
//                self.logInButton.y += keyboardSize.height
//                self.forgotUsernamePassword.frame.origin.y += keyboardSize.height
//                keyboardShowing = true
//            }
//        }
//    }
    
    func prepareLayout() {
        
//        navigationItem.backButton.tintColor = UIColorFromRGB(rgbValue: 0xfcfcfa)
//        seroundLogo.image = Constants.startUpLogos[currentColor]
//        logInButton.backgroundColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        
        self.email.textAlignment = NSTextAlignment.center
        self.email.attributedPlaceholder = NSAttributedString(string: "Email address",
                                                              attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xfcfcfa).withAlphaComponent(0.7)])
        self.email.textColor = UIColorFromRGB(rgbValue: 0xfcfcfa)
        self.password.textAlignment = NSTextAlignment.center
        self.password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                 attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xfcfcfa).withAlphaComponent(0.7)])
        self.password.textColor = UIColorFromRGB(rgbValue: 0xfcfcfa)
        forgotUsernamePassword.setTitleColor(UIColorFromRGB(rgbValue:0x31597F), for: UIControlState.normal)
        email.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        password.tintColor = UIColorFromRGB(rgbValue: UInt(Constants.startUpColors[self.currentColor]))
        email.delegate = self
        password.delegate = self
        
//        setGradientBackground()

        

        logInButton.layer.cornerRadius = 6
//        logInButton.layer.shadowColor = UIColorFromRGB(rgbValue: 0x31597F).cgColor
//        logInButton.layer.shadowOpacity = 0.3
//        logInButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
//        logInButton.layer.shadowRadius = 4.0
//        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    func login() {
        
        
//        self.logInButton.loadingIndicator(true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        gotoMainScene()

//        ApiFunctions.login(email: email.text!, password: password.text!, device_token: appDelegate.deviceToken, completion: { (message, res, token, imageData, userFirstName, userLastName, phoneNumber, email) in
//
//            if (res) {
//                self.logInButton.loadingIndicator(false)
//                UserManager.sharedInstance.addUser(email: email, firstName: userFirstName, lastName: userLastName, imageData: imageData, phoneNumber: phoneNumber, token: token, deviceToken: appDelegate.deviceToken, messageBadgeCounter: 0, requestBadgeCounter: 0, appointmentBadgeCounter: 0)
//
//                self.gotoMainScene()
//
//
//            } else {
//                self.logInButton.loadingIndicator(false)
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
//        if email.text!.characters.count == 0{
//            result = Constants.CHECK_EMAIL_EMPTY
//            self.email.attributedPlaceholder = NSAttributedString(string: "Email address",
//                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
//        }
//        else if !CommonUtils.isEmailValid(email.text!) {
//            result = Constants.CHECK_EMAIL_INVALID
//        }
//        else if password.text?.characters.count == 0{
//            result = Constants.CHECK_PASSWORD_EMPTY
//            self.password.attributedPlaceholder = NSAttributedString(string: "Password",
//                                                                     attributes: [NSAttributedStringKey.foregroundColor: UIColorFromRGB(rgbValue: 0xEB3C23)])
//        } else if !CommonUtils.isPasswordValid(password.text!) {
//            result = Constants.CHECK_PASSWORD_FORMAT
//        }
        return result
    }
    
}
