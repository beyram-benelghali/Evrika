//
//  CandidateHomeVC.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/10/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit
import AZTabBar

class CandidateHomeVC: UIViewController {

    var icons = [String]()
    var tabController:AZTabBarController!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("helloo")
        prepareIcons()
        tabController = AZTabBarController.insert(into: self, withTabIconNames: icons, andSelectedIconNames: icons)
        tabController.delegate = self
        self.navigationController?.isNavigationBarHidden = true  //Hide
        let profile = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")
        let nearbyJobs = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NearbyJobsVC")
        tabController.setViewController(profile, atIndex: 0)
        tabController.setViewController(nearbyJobs, atIndex: 1)
        tabController.setViewController(nearbyJobs, atIndex: 2)
        tabController.defaultColor = .white
        //the color of the icon when a menu is selected
        tabController.selectedColor = .white
        //The color of the icon of a highlighted tab
        tabController.highlightColor = .white
        tabController.buttonsBackgroundColor = UIColor(red: 0.17, green: 0.56, blue: 0.92, alpha: 1)
        tabController.selectionIndicatorColor = .white
        tabController.separatorLineColor =  UIColor(red: 0.17, green: 0.56, blue: 0.92, alpha: 1)
        tabController.separatorLineVisible = false
        tabController.animateTabChange = true
        print( tabController == nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func prepareIcons() {
        icons.append("Profile")
        icons.append("NearbyJobs")
        icons.append("Offers")
    }

}

extension CandidateHomeVC : AZTabBarDelegate {
    
}
