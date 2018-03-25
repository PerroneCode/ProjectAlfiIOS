//
//  ViewController.swift
//  SwipingView
//
//  Created by Arun on 5/9/16.
//  Copyright © 2016 Arun. All rights reserved.
//

import UIKit
import QuartzCore

class RadialGradientLayer: CALayer {
    
    
    override init(){
        
        super.init()
        
        needsDisplayOnBoundsChange = true
    }
    
    init(center:CGPoint,radius:CGFloat,colors:[CGColor]){
        
        self.center = center
        self.radius = radius
        self.colors = colors
        
        super.init()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        
        super.init()
        
    }
    
    var center:CGPoint = CGPoint(x: 50, y: 50)
    var radius:CGFloat = 20
    var colors:[CGColor] = [UIColor(red: 251/255, green: 237/255, blue: 33/255, alpha: 1.0).cgColor , UIColor(red: 251/255, green: 179/255, blue: 108/255, alpha: 1.0).cgColor]
    
    override func draw(in ctx: CGContext) {
        
        ctx.saveGState()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let locations:[CGFloat] = [0.2, 0.3, 0.7]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
        
        let startPoint = CGPoint(x: 0, y: self.bounds.height)
        let endPoint = CGPoint(x: self.bounds.width, y: self.bounds.height)
        
        ctx.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: CGGradientDrawingOptions(rawValue: 0))
        
    }
    
}

//extension UIView {
//    func applyGradient(colours: [UIColor]) -> Void {
//        self.applyGradient(colours: colours, locations: nil)
//    }
//    
//    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = self.bounds
//        gradient.colors = colours.map { $0.cgColor }
//        gradient.locations = locations
//        self.layer.insertSublayer(gradient, at: 0)
//    }
//}

//class Colors {
//    var gl:CAGradientLayer!
//
//    init() {
//        let colorTop = UIColorFromRGB(rgbValue: 0x4c76ff).cgColor
//        let colorBottom = UIColorFromRGB(rgbValue: 0x5AA5E9).cgColor
//
//        self.gl = CAGradientLayer()
//        self.gl.colors = [colorTop, colorBottom]
//        self.gl.locations = [0.0, 1.0]
//    }
//}

class StartUpViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var createAnAccountButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControlView: UIPageControl!
    @IBOutlet weak var bottomView: UIView!
    var dayTime = false
    
    
    @IBAction func createAccountAction(_ sender: UIButton) {
        let nameViewController: NameViewController =
            UIStoryboard.viewController(identifier: "nameViewController") as! NameViewController
        self.navigationController?.pushViewController(nameViewController, animated: true)
    }
    
    
    @IBAction func logInAction(_ sender: Any) {
        
        
        let loginViewController: LoginViewController =
            UIStoryboard.viewController(identifier: "loginViewController") as! LoginViewController
        
        loginViewController.currentColor = self.currentColor
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
        
    }
    
    
    var currentColor = 0

    var slide1Image = UIImageView()
    var slide2Image = UIImageView()
    var slide3Image = UIImageView()
    var slide4Image = UIImageView()
    var slidesArray = [Slide]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        prepareLayout()
        
//        setGradientBackground()
//        let backgroundLayer = colors.gl
//        backgroundLayer?.frame = createAnAccountButton.frame
//        createAnAccountButton.layer.insertSublayer(backgroundLayer!, at: 0)
        
        // Calculate Sunrise and Sunset
//        setUpTheme()
        
        
        self.automaticallyAdjustsScrollViewInsets = false
         UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationController?.isNavigationBarHidden = true
        
        
        scrollView.delegate = self
        let slides:[Slide] = creatSlides()
        setUpSlideScrollView(slides)
        pageControlView.numberOfPages = slides.count
        pageControlView.currentPage = 0

//        slide2Image.image = slide2Image.image!.withRenderingMode(.alwaysTemplate)
//        slide3Image.image = slide3Image.image!.withRenderingMode(.alwaysTemplate)
//        slide4Image.image = slide4Image.image!.withRenderingMode(.alwaysTemplate)

        logInButton.layer.cornerRadius = 25
        logInButton.layer.shadowColor = UIColorFromRGB(rgbValue: 0x212121).cgColor
        
        logInButton.layer.shadowOpacity = 0.3
        logInButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        logInButton.layer.shadowRadius = 3.0
        
        createAnAccountButton.layer.cornerRadius = 25
        createAnAccountButton.layer.borderWidth = 2
//        createAnAccountButton.layer.borderColor = UIColorFromRGB(rgbValue: 0xfcfcfa).withAlphaComponent(0.4)
        //        startColorAnimation()
        
        
    }
    
    func prepareLayout() {
     
        
        self.edgesForExtendedLayout = UIRectEdge.all;

    }
    
    
    func creatSlides() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)!.first as! Slide
        self.slide1Image = slide1.slide1Image
        let slide2:Slide = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)!.first as! Slide
        self.slide2Image = slide2.slide2Image
        let slide3:Slide = Bundle.main.loadNibNamed("Slide3", owner: self, options: nil)!.first as! Slide
        self.slide3Image = slide3.slide3Image
        let slide4:Slide = Bundle.main.loadNibNamed("Slide4", owner: self, options: nil)!.first as! Slide
        self.slide4Image = slide4.slide4Image
        
        if(dayTime) {
            slide1.title1.textColor = UIColorFromRGB(rgbValue: 0x040D14)
            slide2.title2.textColor = UIColorFromRGB(rgbValue: 0x040D14)
            slide3.title3.textColor = UIColorFromRGB(rgbValue: 0x040D14)
            slide4.title4.textColor = UIColorFromRGB(rgbValue: 0x040D14)
        }
        
        return[slide1,slide2,slide3,slide4]
        
    }
    
//    func setUpTheme() {
//        let solar = Solar(latitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!)
//        let isDaytime = solar?.isDaytime
//        if(isDaytime)! {
//            self.dayTime = true
//            self.view.backgroundColor = UIColorFromRGB(rgbValue: 0xFCFCFA)
//            self.createAnAccountButton.setTitleColor(UIColorFromRGB(rgbValue: 0xFCFCFA), for: UIControlState.normal)
//            self.pageControlView.currentPageIndicatorTintColor = UIColorFromRGB(rgbValue: 0x040D14)
//        }
//        
//    }
    
    func setUpSlideScrollView(_ slides: [Slide]) {
        
    scrollView.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)!, width: self.view.frame.width, height: self.view.frame.height - bottomView.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: self.view.frame.height - bottomView.frame.height - (self.navigationController?.navigationBar.frame.height)!)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(slides[i])
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControlView.currentPage = Int(pageIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

