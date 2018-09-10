//
//  GetStartedVC.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/5/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit

class GetStartedVC: UIViewController {


    @IBOutlet weak var typeUser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeType(_ sender: Any) {
        print(typeUser.currentTitle)
        if typeUser.currentTitle == "candidate" {
            typeUser.setTitle("job", for: .normal)
        } else {
            typeUser.setTitle("candidate", for: .normal)
        }
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
