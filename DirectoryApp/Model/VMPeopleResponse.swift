//
//  VMPeopleResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


struct VMPeopleResponse: Codable {
    var avatar: String?
    var createdAt: String?
    var firstName: String?
    var id: String?
    var longitude: Double?
    var favouriteColor: String?
    var email: String?
    var jobTitle: String?
    var latitude: Double?
    var lastName: String?
    var phone: String?
    
    
//    var descriptor: CellDescriptor {
//        let cellDescriptor = CellDescriptor { (cell: PeopleTableViewCell) in
//            cell.config(model: self)
//        }
//        return cellDescriptor
//    }
    

}

