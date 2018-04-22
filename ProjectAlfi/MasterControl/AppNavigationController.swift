
import UIKit
import Material

class AppNavigationController: NavigationController {
    
    var categoryPosition: Int = 0
    
    open override func prepare() {
        super.prepare()

            navigationBar.isTranslucent = true
    
        
        guard let v = navigationBar as? NavigationBar else {
            return
        }
        
        navigationBar.tintColor = UIColor.white
        
        v.depthPreset = .none
//        v.dividerThickness = 2.0
//        v.dividerColor = UIColorFromRGB(rgbValue: 0xE0E0E0)
//        v.backgroundColor = UIColor.clear
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

