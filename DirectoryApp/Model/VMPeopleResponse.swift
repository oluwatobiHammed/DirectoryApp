//
//  VMPeopleResponse.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/07/2021.
//

import Foundation


struct VMPeopleResponse: Codable {
    let avatar, createdAt, firstName,
        id, favouriteColor, email,
        jobTitle, lastName,
        phone: String?
    let longitude, latitude: Double?
    
    var fullName: String? {
        guard let firstName = firstName else {
            return ""
        }
        guard let lastName = lastName else {
            return ""
        }

        return firstName + lastName
    }
}


struct Location {
    var longitude: Double?
    var latitude: Double?
}
