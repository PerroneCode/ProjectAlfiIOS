//
//  MainMenuViewController.swift
//  ProjectAlfi
//
//  Created by Luis F. Perrone on 3/26/18.
//  Copyright © 2018 ThemFireLabs. All rights reserved.
//

import UIKit
import Lottie

class HomeViewController: BaseViewController {
    @IBOutlet weak var hrvView: UIView!
    @IBOutlet weak var mealPlanView: UIView!
    @IBOutlet weak var bpView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    private var boatAnimation: LOTAnimationView?
    @IBOutlet weak var weeksTableView: UITableView!
    
    @IBAction func buttonAction(_ sender: Any) {
        switch (sender as! UIButton).tag {
        case 0:
            let mealPlanViewController = UIStoryboard.viewControllerMain(identifier: "mealPlanViewController") as! MealPlanViewController
                self.navigationController?.present(mealPlanViewController, animated: true, completion: nil)
            break
        case 1:
            break
        case 2:
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    func prepare() {
        
        let shadowSize : CGFloat = 5.0
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.backgroundView.frame.size.width + shadowSize,
                                                   height: self.backgroundView.frame.size.height + shadowSize))
        self.backgroundView.layer.masksToBounds = false
        self.backgroundView.layer.shadowColor = UIColorFromRGB(rgbValue: 0x313131).cgColor
        self.backgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.backgroundView.layer.shadowOpacity = 0.5
        self.backgroundView.layer.shadowPath = shadowPath.cgPath
        
        weeksTableView.delegate = self
        weeksTableView.dataSource = self
        weeksTableView.separatorStyle = .none
        weeksTableView.backgroundColor = UIColor.clear
        
        weeksTableView.register(UINib(nibName: "WeekTableViewCell", bundle: nil), forCellReuseIdentifier: "myWeekCell")
        
        // Create Boat Animation
        boatAnimation = LOTAnimationView(name: "animation")
        // Set view to full screen, aspectFill
//        boatAnimation!.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        boatAnimation!.contentMode = .scaleAspectFill
        boatAnimation!.frame = view.bounds
        // Add the Animation
        view.addSubview(boatAnimation!)
        view.sendSubview(toBack: boatAnimation!)
   
        // create KYCircularProgress
//        let circularProgress = KYCircularProgress(frame: view.bounds)
        
        // create KYCircularProgress with gauge guide
        let circularProgress1 = KYCircularProgress(frame: view1.bounds, showGuide: true)
//        let circularProgress2 = KYCircularProgress(frame: view2.bounds, showGuide: true)
        let circularProgress3 = KYCircularProgress(frame: view3.bounds, showGuide: true)
        
        // support Hex color to RGBA color
        circularProgress1.colors = [UIColorFromRGB(rgbValue: 0x38FF82)]
        circularProgress1.guideColor = UIColorFromRGB(rgbValue: 0x38FF82, alpha: 0.4)
//        circularProgress2.colors = [UIColor.green]
        circularProgress3.colors = [UIColorFromRGB(rgbValue: 0xF94748)]
        circularProgress3.guideColor = UIColorFromRGB(rgbValue: 0xF94748, alpha: 0.4)
        
//        circularProgress1.frame.origin.x = view1.frame.origin.x
//        circularProgress1.frame.origin.y = view1.frame.origin.y
//        circularProgress2.frame.origin.x = view2.frame.origin.x
//        circularProgress2.frame.origin.y = view2.frame.origin.y
//        circularProgress3.frame.origin.x = view3.frame.origin.x
//        circularProgress3.frame.origin.y = view3.frame.origin.y
        
        circularProgress1.progress = 1.0
//        circularProgress2.progress = 0.2
        circularProgress3.progress = 1.0


        view1.addSubview(circularProgress1)
//        view2.addSubview(circularProgress2)
        view3.addSubview(circularProgress3)
        
//        hrvView.backgroundColor = UIColor.clear
//        mealPlanView.backgroundColor = UIColor.clear
//        bpView.backgroundColor = UIColor.clear

       // let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
       // let blurEffect2 = UIBlurEffect(style: UIBlurEffectStyle.regular)
        
        //let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //blurEffectView.frame = hrvView.bounds
       // blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       // blurEffectView.clipsToBounds = true
       // hrvView.addSubview(blurEffectView)
       // hrvView.sendSubview(toBack: blurEffectView)
        
//        let blurEffectView2 = UIVisualEffectView(effect: blurEffect)
//        blurEffectView2.frame = mealPlanView.bounds
//        blurEffectView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        blurEffectView2.clipsToBounds = true
//        mealPlanView.addSubview(blurEffectView2)
//        mealPlanView.sendSubview(toBack: blurEffectView2)
//        
//        let blurEffectView3 = UIVisualEffectView(effect: blurEffect)
//        blurEffectView3.frame = bpView.bounds
//        blurEffectView3.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        blurEffectView3.clipsToBounds = true
//        bpView.addSubview(blurEffectView3)
//        bpView.sendSubview(toBack: blurEffectView3)
        
        
        //Play the first portion of the animation on loop until the download finishes.
//        boatAnimation!.loopAnimation = true
        boatAnimation!.play(fromProgress: 0,
                            toProgress: 1.0,
                            withCompletion: nil)

//
//        // combine Hex color and UIColor
//        circularProgress.colors = [.purple, UIColor(rgba: 0xFFF77A55), .orange]
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = 3
        
        //        if(serviceposts != nil) {
        //
        //        count = serviceposts.count
        //
        //        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myWeekCell", for: indexPath) as! WeekTableViewCell
        cell.backgroundColor = UIColor.clear
        switch indexPath.row {
        case 0:
            cell.changeWeekName(title: "Week 1")
            cell.setWednesday()
            cell.setThursday()
            cell.setFriday()
            cell.setSaturday()
            cell.setSunday()
            break
        case 1:
            cell.changeWeekName(title: "Week 2")
            break
        case 2:
            cell.changeWeekName(title: "Week 3")
            break
        default:
            break
        }
        return cell
        
    }
    
    
    
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 180
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        let cell = tableView.cellForRow(at: indexPath) as! DepartmentHeaderTableViewCell
        
        tableView.deselectRow(at: indexPath, animated: false)
        
//        let filteredSearchViewController = UIStoryboard.viewControllerMain(identifier: "filteredSearchController") as! FilteredSearchViewController
//        filteredSearchViewController.categoryPosition = indexPath.row + 1
//
//        self.navigationController?.pushViewController(filteredSearchViewController, animated: true)
    
    }
}
