//
//  PeopleViewModelTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 18/08/2021.
//

import XCTest
@testable import DirectoryApp
class PeopleViewModelTest: XCTestCase {

    var sut: VMPeopleResponse!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = VMPeopleResponse(avatar: "https://randomuser.me/api/portraits/women/13.jpg", createdAt: "(927) 840-0095 x2527", firstName: "Maybell", id: "1", favouriteColor: "#122a33", email: "Izaiah.Little@hotmail.com", jobTitle: "Customer Markets Architect", lastName: "Durgan", phone: "(927) 840-0095 x2527", longitude: 139.6922, latitude: 35.6897)
    }

}
