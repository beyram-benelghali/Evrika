//
//  RecruiterProfileVC.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/12/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit

class RecruiterProfileVC: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundProfilePic()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func roundProfilePic() {
        
        self.imageProfile.layer.cornerRadius = self.imageProfile.frame.size.width / 2;
        self.imageProfile.clipsToBounds = true;
        self.imageProfile.layer.borderWidth = 3.0
        self.imageProfile.layer.borderColor = UIColor.yellow.cgColor;
    }

}
