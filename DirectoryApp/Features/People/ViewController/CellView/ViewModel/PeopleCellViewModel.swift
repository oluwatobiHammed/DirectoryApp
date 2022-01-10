//
//  PeopleTableViewCellViewModel.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 07/01/2022.
//

import Foundation


struct PeopleCellViewModel {
    let name,email,
        color, jobTitle,
        avatar, phone : String
    let latitude, longitude: Double
    
    init(people: VMPeopleResponse) {
        self.name = " Name: \(people.fullName!)"
        self.email = " Email: \(people.email!)"
        self.jobTitle = "Job Title: \(people.jobTitle!)"
        self.color = people.favouriteColor!
        self.avatar = people.avatar!
        self.phone = people.phone!
        self.latitude = people.latitude!
        self.longitude = people.longitude!
    }
}
