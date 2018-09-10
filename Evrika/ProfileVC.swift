//
//  ProfileVC.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/10/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var tableViewSkills: UITableView!

    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.width / 2;
        self.profilePicture.clipsToBounds = true;
        self.profilePicture.layer.borderWidth = 3.0
        self.profilePicture.layer.borderColor = UIColor.yellow.cgColor;
        tableViewSkills?.register(SkillCell.nib, forCellReuseIdentifier:
            SkillCell.identifier)
        tableViewSkills?.delegate = self
        tableViewSkills?.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension ProfileVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewSkills.dequeueReusableCell(withIdentifier:
            SkillCell.identifier, for: indexPath) as? SkillCell
        {
            print("foundcell")
            cell.configureWithItem(item: "Java")
            return cell
        }
        print("notfoundcell")
        return UITableViewCell()

    }
}

extension ProfileVC : UITableViewDelegate {
    
}
