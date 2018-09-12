//
//  JobDetailVC.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/11/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit

class JobDetailVC: UIViewController {

    @IBOutlet weak var tableRequiredSkills: UITableView!
    
    @IBOutlet weak var tableAdditionalSkills: UITableView!
    @IBOutlet weak var viewDetails: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableRequiredSkills?.register(SkillDetailCell.nib, forCellReuseIdentifier:
            SkillDetailCell.identifier)
        tableRequiredSkills?.delegate = self
        tableRequiredSkills?.dataSource = self
        
        tableAdditionalSkills?.register(SkillDetailCell.nib, forCellReuseIdentifier:
            SkillDetailCell.identifier)
        tableAdditionalSkills?.delegate = self
        tableAdditionalSkills?.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func dismissDescription(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension JobDetailVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableRequiredSkills {
            return 3
        } else {
            return 4
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableRequiredSkills {
            if let cell = tableRequiredSkills.dequeueReusableCell(withIdentifier:
                SkillDetailCell.identifier, for: indexPath) as? SkillDetailCell
            {
                print("foundcell")
                cell.configureWithItem(item: "Java")
                return cell
            }
            print("notfoundcell")
            return UITableViewCell()
        } else {
            if let cell = tableAdditionalSkills.dequeueReusableCell(withIdentifier:
                SkillDetailCell.identifier, for: indexPath) as? SkillDetailCell
            {
                print("foundcell")
                cell.configureWithItem(item: "English")
                return cell
            }
            print("notfoundcell")
            return UITableViewCell()
        }
        
    }
}

extension JobDetailVC : UITableViewDelegate {
    
}
