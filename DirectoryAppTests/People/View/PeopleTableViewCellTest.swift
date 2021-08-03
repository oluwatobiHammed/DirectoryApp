//
//  PeopleTableViewCellTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 03/08/2021.
//

import XCTest
@testable import DirectoryApp
class PeopleTableViewCellTest: XCTestCase {
    //var tableview: UITableView!
    var cell:PeopleTableViewCell!
    var people: VMPeopleResponse!
    //var sut: PeopleTableViewCellViewModel!
    var storyboard: UIStoryboard!
    var sut: PeopleViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SecondViewController") as PeopleViewController
        //sut.tableview.register(UINib(nibName: PeopleTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier:  PeopleTableViewCell.Identifier)
        people = VMPeopleResponse(avatar: "https://randomuser.me/api/portraits/women/13.jpg", createdAt: "(927) 840-0095 x2527", firstName: "Maybell", id: "1", favouriteColor: "#122a33", email: "Izaiah.Little@hotmail.com", jobTitle: "Customer Markets Architect", lastName: "Durgan", phone: "(927) 840-0095 x2527", longitude: 139.6922, latitude: 35.6897)
        //sut = PeopleTableViewCellViewModel(people: people)
        cell = PeopleTableViewCell()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        people = nil
        sut = nil
    }
    
    func testPeopleViewController_WhenCreated_HasRequiredTableView() throws {
        let tableview = try XCTUnwrap(sut.tableview, "The tableview is not connected to an IBOutlet")
        tableview.register(UINib(nibName: PeopleTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier:  PeopleTableViewCell.Identifier)
        XCTAssertNotNil(tableview)
    }
    
    func testPeopleTableViewCellViewModel() {
        // what is it that we want to test?
        //XCTAssertEqual(cell.fullNameLabel.text!, sut.fullName)
        
        
    }
    

}
