import UIKit
import Material

class AppNavigationDrawerController: NavigationDrawerController {
    var profileViewIsRoot = false
    var userMenuButton: IconButton!
    
    open override func prepare() {
        super.prepare()
        delegate = self
//        prepareUserMenuButton()
        self.navigationItem.backButton.tintColor = UIColorFromRGB(rgbValue: 0xfcfcfa)
    }
}

extension AppNavigationDrawerController: NavigationDrawerControllerDelegate {

//    func prepareUserMenuButton() {
//        userMenuButton = IconButton(image: #imageLiteral(resourceName: "userMenu").resizedImage(newSize: CGSize(width: 24, height: 24)).withRenderingMode(UIImageRenderingMode.alwaysTemplate))
//        userMenuButton.tintColor = UIColorFromRGB(rgbValue: 0xfcfcfa)
//        userMenuButton.addTarget(self, action: #selector(AppNavigationDrawerController.buttonClicked(_:)), for: .touchUpInside)
//    }
//    
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, willOpen position: NavigationDrawerPosition) {
//        if profileViewIsRoot {
//            self.navigationItem.rightViews = []
//        }
        print("navigationDrawerController willOpen")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didOpen position: NavigationDrawerPosition) {
        print("navigationDrawerController didOpen")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, willClose position: NavigationDrawerPosition) {
//        if profileViewIsRoot {
//            self.navigationItem.rightViews = [userMenuButton]
//        }
        print("navigationDrawerController willClose")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didClose position: NavigationDrawerPosition) {
        print("navigationDrawerController didClose")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didBeginPanAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didBeginPanAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didChangePanAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didChangePanAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didEndPanAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didEndPanAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, didTapAt point: CGPoint, position: NavigationDrawerPosition) {
        print("navigationDrawerController didTapAt: ", point, "with position:", .left == position ? "Left" : "Right")
    }
    
    func navigationDrawerController(navigationDrawerController: NavigationDrawerController, statusBar isHidden: Bool) {
        print("navigationDrawerController statusBar is hidden:", isHidden ? "Yes" : "No")
    }
    
    func buttonClicked(_ sender: AnyObject?) {
        
        if sender === userMenuButton {
            self.openRightView()
        }
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    

}
