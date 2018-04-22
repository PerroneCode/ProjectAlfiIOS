import UIKit
import Material
//import Toast_Swift
//import CoreLocation

final class MasterViewController: BaseViewController {
    
    var segmentedControl: UISegmentedControl = UISegmentedControl()
    
    private lazy var homeViewController: HomeViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    public lazy var analysisViewController: AnalysisViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "analysisViewController") as! AnalysisViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var forumViewController: ForumViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "forumViewController") as! ForumViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var mealPlanViewController: MealPlanViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "mealPlanViewController") as! MealPlanViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var dailyTestViewController: DailyTestViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "dailyTestViewController") as! DailyTestViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    var currentController: UIViewController!

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        currentController = homeViewController
        setupView()
        print( " NavigationBar Width: \(self.navigationController?.navigationBar.frame.width)")
        print( " Screen Width: \(UIScreen.main.bounds.size.width)")
        
//        if #available(iOS 10.0, *) {
//            let isEmpty = UserManager.sharedInstance.isEmpty
//
//            if (!isEmpty) {
//                checkUser()
//            } else {
//                //                goToLoginSignpScene()
//            }
//        } else {
//            // Fallback on earlier versions
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
//    func checkUser() {
//        UserManager.sharedInstance.userData()
//        let user_id = UserManager.sharedInstance.user[0].token!
//        let lastName = UserManager.sharedInstance.user[0].lastName!
//        let customerName = "\(UserManager.sharedInstance.user[0].firstName!) \(lastName.first!)."
//
//        ApiFunctions.userCheck(user_id: user_id) { (response, provider_id, provider_name, provider_avatar, service_id, service, category) in
//
//            if response == Constants.RES_SUCCESS {
//                let providerReviewViewController = UIStoryboard.viewControllerMain(identifier: "providerReviewViewController") as! ProviderReviewViewController
//                providerReviewViewController.provider_id = provider_id
//                providerReviewViewController.provider_name = provider_name
//                providerReviewViewController.provider_avatar = provider_avatar
//                providerReviewViewController.customer_id = user_id
//                providerReviewViewController.customer_name = customerName
//                providerReviewViewController.service_id = service_id
//                providerReviewViewController.service = service
//                providerReviewViewController.category = category
//                providerReviewViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//                self.navigationController?.present(providerReviewViewController, animated: true, completion: nil)
//
//            }
//        }
//    }
    
    // MARK: - View Methods
    
    private func setupView() {
        setupSegmentedControl()
        prepareMenuButton()
//        prepareFilterButton()
        prepareNavigationItem()
        prepareBackButton()
//        prepareDownButton()
        //        menuButton.addTarget(self, action: #selector(self.buttonClicked(_:)), for: .touchUpInside)
        
        navigationItem.titleLabel.textColor = UIColorFromRGB(rgbValue: 0xfcfcfa)
        navigationItem.titleLabel.font = UIFont(name: "museosans-500", size: 16)
        navigationController?.navigationBar.tintColor = UIColorFromRGB(rgbValue: 0xA9A9AF)
        
        updateView()
        
        
    }

    
    func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
            remove(asChildViewController: currentController)
            add(asChildViewController: homeViewController)
            currentController = homeViewController
            menuButton.tintColor = UIColorFromRGB(rgbValue: 0x212121)
            navigationItem.titleLabel.text = ""
            self.navigationDrawerController?.isRightPanGestureEnabled = true
        } else if segmentedControl.selectedSegmentIndex == 1 {
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
            remove(asChildViewController: currentController)
            add(asChildViewController: analysisViewController)
            currentController = analysisViewController
            menuButton.tintColor = UIColorFromRGB(rgbValue: 0x212121)
            navigationItem.titleLabel.text = ""
            self.navigationDrawerController?.isRightPanGestureEnabled = false
            
        } else if segmentedControl.selectedSegmentIndex == 2 {
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
            remove(asChildViewController: currentController)
            add(asChildViewController: mealPlanViewController)
            currentController = mealPlanViewController
            menuButton.tintColor = UIColorFromRGB(rgbValue: 0x212121)
            self.navigationItem.titleLabel.text = ""
            self.navigationDrawerController?.isRightPanGestureEnabled = false
        } else if segmentedControl.selectedSegmentIndex == 3 {
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
            remove(asChildViewController: currentController)
            add(asChildViewController: dailyTestViewController)
            currentController = dailyTestViewController
            menuButton.tintColor = UIColorFromRGB(rgbValue: 0x212121)
            self.navigationItem.titleLabel.text = ""
            self.navigationDrawerController?.isRightPanGestureEnabled = false
        } else if segmentedControl.selectedSegmentIndex == 4 {
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
            remove(asChildViewController: currentController)
            add(asChildViewController: forumViewController)
            currentController = forumViewController
            menuButton.tintColor = UIColorFromRGB(rgbValue: 0x212121)
            self.navigationItem.titleLabel.text = ""
            self.navigationDrawerController?.isRightPanGestureEnabled = false
        }
    }
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Home", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Messages", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "Appointments", at: 2, animated: false)
        segmentedControl.insertSegment(withTitle: "Favorites", at: 3, animated: false)
        segmentedControl.insertSegment(withTitle: "Requests", at: 4, animated: false)
        segmentedControl.insertSegment(withTitle: "FilteredSearch", at: 5, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }
    
    // MARK: - Actions
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    // MARK: - Helper Methods
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    @objc func buttonClicked(_ sender: AnyObject?) {
        
        if sender === menuButton {
            //            navigationDrawerController?.openLeftView()
            navigationDrawerController?.toggleLeftView()
            
        }
    }
    
//    func notificationRead() {
//        menuButton.image = Icon.cm.menu
//    }
//
//    func notificationUnread() {
//        menuButton.image = #imageLiteral(resourceName: "cm_menu_white_badge")
//    }
    
}
