//
//  MealPlanViewController.swift
//  ProjectAlfi
//
//  Created by Luis F. Perrone on 4/21/18.
//  Copyright © 2018 ThemFireLabs. All rights reserved.
//

import UIKit

class MealPlanViewController: UIViewController {
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var breakfastView: UIView!
    @IBOutlet weak var lunchView: UIView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var breakfastViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lunchViewConstraint: NSLayoutConstraint!
    
    var breakfastExpanded = true
    var lunchExpanded = true
    var dinnerExpanded = true
    
    @IBAction func buttonAction(_ sender: Any) {
        switch (sender as! UIButton).tag {
        case 0:
            if breakfastExpanded {
                UIView.animate(withDuration: 0.3, animations: {
                    self.breakfastView.alpha = 0.0
                    self.breakfastViewHeightConstraint.constant = 0.0
                })
                breakfastExpanded = false
                breakfastButton.setImage(#imageLiteral(resourceName: "icons8-plus-filled-100"), for: .normal) 
            } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.breakfastView.alpha = 1.0
                self.breakfastViewHeightConstraint.constant = 563.0
                
            })
                breakfastExpanded = true
                breakfastButton.setImage(#imageLiteral(resourceName: "icons8-minus-filled-100"), for: .normal)
            }
            break
        case 1:
            if lunchExpanded {
                UIView.animate(withDuration: 0.3, animations: {
                    self.lunchView.alpha = 0.0
                    self.lunchViewConstraint.constant = 0.0
                })
                lunchExpanded = false
                lunchButton.setImage(#imageLiteral(resourceName: "icons8-plus-filled-100"), for: .normal)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.lunchView.alpha = 1.0
                    self.lunchViewConstraint.constant = 563.0
                    
                })
                lunchExpanded = true
                lunchButton.setImage(#imageLiteral(resourceName: "icons8-minus-filled-100"), for: .normal)
            }
            break
        case 2:
            break
        case 3:
            if let nav = self.navigationController {
                nav.popViewController(animated: true)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
            break
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.frame = CGRect(x: 0, y: 0 , width: self.view.frame.width, height: 400)
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 2000)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
