import UIKit
import AudioToolbox

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLoadingView()
    {
        self.view.isUserInteractionEnabled = false
    }
    
    func hideLoadingView()
    {
        self.view.isUserInteractionEnabled = true
    }
    
    func playSuccessfulSound() {
        var soundURL: NSURL?
        var soundID:SystemSoundID = 2
        let filePath = Bundle.main.path(forResource: "sound4", ofType: "wav")
        soundURL = NSURL(fileURLWithPath: filePath!)
        AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    func playErrorSound()  {
        var soundURL: NSURL?
        var soundID:SystemSoundID = 1
        let filePath = Bundle.main.path(forResource: "ErrorSound", ofType: "wav")
        soundURL = NSURL(fileURLWithPath: filePath!)
        AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    func playNewMessageSound()  {
        var soundURL: NSURL?
        var soundID:SystemSoundID = 0
        let filePath = Bundle.main.path(forResource: "newMessage", ofType: "wav")
        soundURL = NSURL(fileURLWithPath: filePath!)
        AudioServicesCreateSystemSoundID(soundURL!, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
//    func gotoMainScene(){
//
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
//        let window = UIApplication.shared.keyWindow
//
//        let appNavController: AppNavigationController =
//            UIStoryboard.viewControllerMain(identifier: "AppNavigationController") as! AppNavigationController
//
//        let leftViewController: LeftViewController = UIStoryboard.viewControllerMain(identifier: "LeftViewController") as! LeftViewController
//
//        let rightViewController: RightViewController = UIStoryboard.viewControllerMain(identifier: "RightViewController") as! RightViewController
//
//        let appNavigationDrawerController: AppNavigationDrawerController =  AppNavigationDrawerController(rootViewController: appNavController, leftViewController: leftViewController, rightViewController: rightViewController)
//
//
//        //setNavigationRoots()
//        window?.rootViewController = appNavigationDrawerController
//
//    }
    
    func setGradientBackground() {
        
//        let radialGradientLayer = RadialGradientLayer(center: view.center, radius: self.view.height+20/2, colors: [UIColorFromRGB(rgbValue: 0x4c76ff).cgColor, UIColorFromRGB(rgbValue: 0x4c76ff).cgColor, UIColorFromRGB(rgbValue: 0x62c3dd).cgColor])
//        
//        radialGradientLayer.frame = view.bounds
//        radialGradientLayer.setNeedsDisplay()
//        
//        view.layer.insertSublayer(radialGradientLayer, at: 0)
        
        view.backgroundColor = UIColorFromRGB(rgbValue: 0x5AA5E9)
        
    }
    
//    func setGradientBackground(_ view: UIView) {
//
//        let radialGradientLayer = RadialGradientLayer(center: view.center, radius: self.view.layer.height+20/2, colors: [UIColorFromRGB(rgbValue: 0x767D86).cgColor, UIColorFromRGB(rgbValue: 0x767D86).cgColor, UIColorFromRGB(rgbValue: 0x767D86).cgColor])
//
////          let radialGradientLayer = RadialGradientLayer(center: view.center, radius: self.view.height+20/2, colors: [UIColorFromRGB(rgbValue: 0x5AA5E9).cgColor, UIColorFromRGB(rgbValue: 0x5AA5E9).cgColor, UIColorFromRGB(rgbValue: 0x4c76ff).cgColor])
////        0x727D8C
//        radialGradientLayer.frame = view.bounds
//        radialGradientLayer.setNeedsDisplay()
//
//        view.layer.insertSublayer(radialGradientLayer, at: 0)
//
////        view.backgroundColor = UIColorFromRGB(rgbValue: 0x5AA5E9)
//
//    }
//
//
//    func goToLoginSignpScene() {
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
//        let window = UIApplication.shared.keyWindow
//
//        let appNavigationController: AppNavigationController = UIStoryboard.viewController(identifier: "startNavigationController") as! AppNavigationController
//
//        window?.rootViewController = appNavigationController
//
//
//    }
//
    /* Download Images from URL */
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, resposne, error) in completion(data, resposne, error)
            }.resume()
        
    }
    
    func downloadImage(url: URL, image: UIImageView) {
        print("Download Started")
        getDataFromUrl(url: url) {
            (data, response, error) in guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in image.image = UIImage(data: data)
            }
        }
    }
    
    /* Get Colors From RGB */
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }

    
}
