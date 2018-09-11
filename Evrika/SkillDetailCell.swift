//
//  SkillDetailCell.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/12/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit

class SkillDetailCell: UITableViewCell {

    @IBOutlet weak var skillName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWithItem(item: String) {
        skillName?.text = item
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
