//
//  PeopleTableViewCell.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 11/07/2021.
//

import UIKit


class PeopleTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewer: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var cardView: DesignView!
    @IBOutlet weak var locationButton: UIButton!
    var location = Location()
    
    
    func config ( _ person: VMPeopleResponse) {
        if let avatar = person.avatar,
           let email = person.email,
           let fullName = person.fullName,
           let jobTitle = person.jobTitle,
           let favouriteColor = person.favouriteColor,
           let latitude = person.latitude,
           let longitude = person.longitude
        {
            imageViewer.setImage(imageUrl: avatar)
            fullNameLabel.useDefaultFont()
            emailLabel.useDefaultFont()
            jobTitleLabel.useDefaultFont()
            fullNameLabel.text = "Name: " + fullName
            emailLabel.text = "Email: " + email
            jobTitleLabel.text = "Job Title: " + jobTitle
            cardView.shadowColor = UIColor.colorFromHexString(favouriteColor)
            location.latitude = latitude
            location.longitude = longitude
        }
        
        
    }
    

    
    @IBAction func mapButtonPressed(_ sender: UIButton) {
        
    }
    
}
