//
//  JobOffersVC.swift
//  Evrika
//
//  Created by Besbes Ahmed on 9/10/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit
import Koloda

private var numberOfCards: Int = 5

class JobOffersVC: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    fileprivate var dataSource: [UIImage] = {
        var array: [UIImage] = []
        for index in 0..<numberOfCards {
        array.append(UIImage(named: "Card_like_\(index + 1)")!)
        }
        
        return array
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    }
    
    
    // MARK: IBActions
    
    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(.left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(.right)
    }
    
    @IBAction func undoButtonTapped() {
        kolodaView?.revertAction()
    }
}

// MARK: KolodaViewDelegate

extension JobOffersVC: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        let position = kolodaView.currentCardIndex
        for i in 1...4 {
            dataSource.append(UIImage(named: "Card_like_\(i)")!)
        }
        kolodaView.insertCardAtIndexRange(position..<position + 4, animated: true)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
    }
    
}

// MARK: KolodaViewDataSource

extension JobOffersVC: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        //return UIImageView(image: dataSource[Int(index)])
        let CustomCardView = Bundle.main.loadNibNamed("JobOfferCardView", owner: self, options: nil)?[0] as! JobOfferVC
     /*   if !self.jobOffers.isEmpty {
            CustomCardView.companyNameTextfield.text = self.jobOffers[index]["company_name"] as? String
            CustomCardView.jobTitleTextfield.text = self.jobOffers[index]["job_title"] as? String
            //CustomCardView.companyImage = UIImageView(image: UIImage(url: (self.jobOffers[index]["comapny_image"] as? String)!))
            //UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:MyURL]]];
            let image_URl = self.jobOffers[index]["company_image"] as? String
            CustomCardView.companyImage.imageFromServerURL(urlString: Session.Local+"/JobFinder/images/"+image_URl!, PlaceHolderImage: #imageLiteral(resourceName: "logo placeholder"))
            CustomCardView.companyImage.roundedImage()
        }*/
       
        /// Adds a border to our CustomCardView
        CustomCardView.layer.borderWidth = 0.5
        CustomCardView.layer.borderColor = UIColor.gray.cgColor
        /// make CustomCardView edges round
        CustomCardView.layer.cornerRadius = 8.0
        CustomCardView.clipsToBounds = true
        /// Adds a shadow to our CustomCardView
        CustomCardView.layer.masksToBounds = false
        CustomCardView.layer.shadowOffset = CGSize(width: -1, height: 1)
        CustomCardView.layer.shadowRadius = 20
        CustomCardView.layer.shadowOpacity = 0.2
        
        return CustomCardView
        
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}
