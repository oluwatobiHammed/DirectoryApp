//
//  PeopleTableViewCell.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 11/07/2021.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewer: UIImageView!
    
    func config ( _ person: VMPeopleResponse) {
        if let avatar = person.avatar {
            imageViewer.setImage(imageUrl: avatar)
        }
       
    }
    
}
