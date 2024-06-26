//
//  JobOfferVC.swift
//  Evrika
//
//  Created by Besbes Ahmed on 9/12/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit

class JobOfferVC: UIView {

    @IBOutlet weak var CompanyNameLbl: UILabel!
    
    @IBOutlet weak var JobTitleLbl: UILabel!
    
    @IBOutlet weak var JobDescriptionLbl: UILabel!
    @IBOutlet weak var JobTypeLbl: UILabel!
    @IBOutlet weak var JobSalaryLbl: UILabel!
}
extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
