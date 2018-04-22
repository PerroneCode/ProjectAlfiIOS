
import UIKit
import Material

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class LeftViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var homeButton: UIView!
    @IBOutlet weak var messagesButton: UIView!
    @IBOutlet weak var appointmentsButton: UIView!
    @IBOutlet weak var favoritesButton: UIView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var messagesLabel: UILabel!
    @IBOutlet weak var appointmentsLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var messagesImage: UIImageView!
    @IBOutlet weak var appointmentsImage: UIImageView!
    @IBOutlet weak var favoritesImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var requestsButton: UIView!
    
    @IBOutlet weak var requestsImage: UIImageView!
    
    @IBOutlet weak var requestsLabel: UILabel!
    
    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var helpImage: UIImageView!
    @IBOutlet weak var inviteImage: UIImageView!
    @IBOutlet weak var feedbackImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var settingsTab: UIView!
    @IBOutlet weak var header: UIView!
    
    
    
    var currentItemSelected = 0
    
    
    
    @IBAction func menuItemPressed(_ sender: UIButton) {
        
        let appNavController = self.navigationDrawerController?.rootViewController as! AppNavigationController
        let masterViewController = appNavController.viewControllers.first as! MasterViewController
        
        if(currentItemSelected != sender.tag) {
            
            //            let rightViewController = self.navigationDrawerController?.rightViewController as!
            //                RightViewController
            
            switch(sender.tag) {
                
            case 0:
                highlightItemSelected(0)
                masterViewController.segmentedControl.selectedSegmentIndex = 0
                masterViewController.updateView()
                self.navigationDrawerController?.closeLeftView()
                break
                
            case 1:
                highlightItemSelected(1)
                masterViewController.segmentedControl.selectedSegmentIndex = 1
                masterViewController.updateView()
                self.navigationDrawerController?.closeLeftView()
                break
                
            case 2:
                highlightItemSelected(2)
                masterViewController.segmentedControl.selectedSegmentIndex = 2
                masterViewController.updateView()
                self.navigationDrawerController?.closeLeftView()
                break
                
            case 3:
                highlightItemSelected(3)
                masterViewController.segmentedControl.selectedSegmentIndex = 3
                masterViewController.updateView()
                self.navigationDrawerController?.closeLeftView()
                break
                
            case 4:
                highlightItemSelected(4)
                masterViewController.segmentedControl.selectedSegmentIndex = 4
                masterViewController.updateView()
                self.navigationDrawerController?.closeLeftView()
                break
            case 5:
                let rentSensorsViewController: RentSensorsViewController =
                    UIStoryboard.viewControllerMain(identifier: "rentSensorsViewController") as! RentSensorsViewController
                let appNavController = self.navigationDrawerController?.rootViewController as! AppNavigationController
                rentSensorsViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                appNavController.present(rentSensorsViewController, animated: true, completion: nil)
                self.navigationDrawerController?.closeLeftView()
                
                break
                
            default:
                
                break
                
            }
            
        } else {
            
            print("Item selected is equal to currentItemSelected")
        }
        
        
        
    }
    
    /**
     *  Array to display menu options
     */
    @IBOutlet var tblMenuOptions : UITableView!
    
    /**
     *  Array containing menu options
     */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
//        if #available(iOS 10.0, *) {
//            let isEmpty = UserManager.sharedInstance.isEmpty
//
//            if (!isEmpty) {
//                profileImage.borderWidth = 1
//                profileImage.borderColor = UIColorFromRGB(rgbValue: 0x313131)
//                UserManager.sharedInstance.userData()
//                if let checkedUrl = URL(string: UserManager.sharedInstance.user[0].imageData!) {
//                    downloadImage(url: checkedUrl, image: profileImage)
//
//                } else if let decodedData = NSData(base64Encoded: UserManager.sharedInstance.user[0].imageData!, options:NSData.Base64DecodingOptions.ignoreUnknownCharacters) {
//                    profileImage.image = UIImage(data:decodedData as Data,scale:1.0)
//                } else {
//                    profileImage.image = #imageLiteral(resourceName: "img_profile")
//                }
//                let firstName = UserManager.sharedInstance.user[0].firstName!
//                let lastName = UserManager.sharedInstance.user[0].lastName!
//                userName.text = firstName + " " + lastName
//                userEmail.text = UserManager.sharedInstance.user[0].email
//            } else {
//                goToLoginSignpScene()
//            }
//        } else {
//            // Fallback on earlier versions
//        }
        
        //        profileImage.layer.borderWidth = 1.0
        //        profileImage.layer.borderColor = UIColorFromRGB(rgbValue: 0xFCFCFA).cgColor
        prepareLayout()
        //        homeButton.backgroundColor = UIColorFromRGB(rgbValue: 0x28292B)
        homeButton.alpha = 0.7
        //        tblMenuOptions.tableFooterView = UIView()
        //        view.backgroundColor = Color.blue.base
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Home", "icon":"ic_home"])
        arrayMenuOptions.append(["title":"Messages", "icon":"ic_chat"])
        
        tblMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        
        if (self.delegate != nil) {
            print("self.delegate not equal to null")
            let index = Int32(button.tag)
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        print("Self Delegate equal to null")
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        
        imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        print("Button at \(indexPath.row) selected")
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func prepareLayout() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LeftViewController.tapFunction))
        settingsTab.isUserInteractionEnabled = true
        settingsTab.addGestureRecognizer(tap)
        
        header.layer.shadowOpacity = 0.3
        header.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        header.layer.shadowRadius = 3.0
        header.layer.masksToBounds = false
            
    
        
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("Tap called")
        let settingsViewController: SettingsViewController =
            UIStoryboard.viewControllerMain(identifier: "settingsViewController") as! SettingsViewController
        let appNavController = self.navigationDrawerController?.rootViewController as! AppNavigationController
        appNavController.pushViewController(settingsViewController, animated: true)
        self.navigationDrawerController?.closeLeftView()
    }
    
    // Highlight Current Item in Left Drawer
    func highlightItemSelected(_ itemSelected:Int) {
        
        let appNavController = self.navigationDrawerController?.rootViewController as! AppNavigationController
        let masterViewController = appNavController.viewControllers.first as! MasterViewController
        
        switch(currentItemSelected) {
            
        case 0:
            homeButton.alpha = 1
//            homeImage.image = #imageLiteral(resourceName: "Seround_App_Icon_80px-unclicked")
            break
            
        case 1:
            messagesButton.alpha = 1
//            messagesImage.image = #imageLiteral(resourceName: "messages")
            break
            
        case 2:
            appointmentsButton.alpha = 1
//            appointmentsImage.image = #imageLiteral(resourceName: "briefcase")
            break
            
        case 3:
            favoritesButton.alpha = 1
//            favoritesImage.image = #imageLiteral(resourceName: "heart")
            break
            
        case 4:
            requestsButton.alpha = 1
//            requestsImage.image = #imageLiteral(resourceName: "requestService-unclicked")
            break
            
        default:
            break
            
        }
        
//        UserManager.sharedInstance.userData()
        
        switch(itemSelected) {
            
        case -1:
            
            self.currentItemSelected = -1
            print("No item selected")
            break
            
        case 0:
            homeButton.alpha = 0.7
            self.currentItemSelected = 0
//            homeImage.image = #imageLiteral(resourceName: "Seround_App_Icon_clicked")
            break
            
        case 1:
            messagesButton.alpha = 0.7
            self.currentItemSelected = 1
//            messagesImage.image = #imageLiteral(resourceName: "messages-clicked")
            break
            
        case 2:
            appointmentsButton.alpha = 0.7
            self.currentItemSelected = 2
//            appointmentsImage.image = #imageLiteral(resourceName: "briefcase-clicked")
            break
            
        case 3:
            favoritesButton.alpha = 0.7
            self.currentItemSelected = 3
//            favoritesImage.image = #imageLiteral(resourceName: "heart-clicked")
            break
            
        case 4:
            requestsButton.alpha = 0.7
            self.currentItemSelected = 4
//            requestsImage.image = #imageLiteral(resourceName: "requestService")
            break
            
        default:
            break
            
        }
        
        
    }
    
}

