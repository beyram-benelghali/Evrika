//
//  SkillCell.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/10/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell {

    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureWithItem(item: String) {
        // setImageWithURL(url: item.avatarImageURL)
        skillLabel?.text = item
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
