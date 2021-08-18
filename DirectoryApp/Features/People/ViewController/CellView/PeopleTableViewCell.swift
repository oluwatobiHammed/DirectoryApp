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
    
    static let Identifier =  String(describing: PeopleTableViewCell.self)
    
    func config ( _ person: PeopleTableViewCellViewModel)
    {
        imageViewer.layer.cornerRadius = 27
        fullNameLabel.useDefaultFont()
        emailLabel.useDefaultFont()
        jobTitleLabel.useDefaultFont()
        imageViewer.setImage(imageUrl: person.avatar)
        fullNameLabel.text =  person.fullName
        emailLabel.text =  person.email
        jobTitleLabel.text =  person.jobTitle
        cardView.shadowColor = UIColor.colorFromHexString(person.favouriteColor)
    }
    

    
  
    
}
