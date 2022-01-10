//
//  PeopleCellViewModelTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 03/08/2021.
//

import XCTest
@testable import DirectoryApp
class PeopleCellViewModelTest: XCTestCase {

    var people: VMPeopleResponse!
    var sut: PeopleCellViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        people = VMPeopleResponse(avatar: "https://randomuser.me/api/portraits/women/13.jpg", createdAt: "(927) 840-0095 x2527", firstName: "Maybell", id: "1", favouriteColor: "#122a33", email: "Izaiah.Little@hotmail.com", jobTitle: "Customer Markets Architect", lastName: "Durgan", phone: "(927) 840-0095 x2527", longitude: 139.6922, latitude: 35.6897)
        sut = PeopleCellViewModel(people: people)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        people = nil
        sut = nil
    }
    
    func testPeopleTableViewCellViewModel() {
        // what is it that we want to test?
        XCTAssertEqual(people.avatar, sut.avatar)
        XCTAssertEqual(" Email: \(String(describing: people.email!))", sut.email)
        XCTAssertEqual(people.favouriteColor, sut.color)
        XCTAssertEqual(" Name: " + people.fullName!, sut.name)
        XCTAssertEqual("Job Title: " + people.jobTitle!, sut.jobTitle)
        XCTAssertEqual(people.latitude, sut.latitude)
        XCTAssertEqual(people.longitude, sut.longitude)
        
    }
    
 


}
