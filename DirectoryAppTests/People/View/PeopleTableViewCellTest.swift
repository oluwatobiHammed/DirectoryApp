//
//  PeopleTableViewCellTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 03/08/2021.
//

import XCTest
@testable import DirectoryApp
class PeopleTableViewCellTest: XCTestCase {
    
    var cell:PeopleTableViewCell!
    var people: VMPeopleResponse!
    var peopleModel: VMPeopleResponse!
    var mockPeopleRepo: MockPeopleRepo!
    var mockVMRoute: MockVMRoute!
    var baseNetWorkProtocol: MockPeopleNetwork!
    var storyboard: UIStoryboard!
    var sut: PeopleViewController!
    var person: PeopleTableViewCellViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SecondViewController") as PeopleViewController
        people = VMPeopleResponse(avatar: "https://randomuser.me/api/portraits/women/13.jpg", createdAt: "(927) 840-0095 x2527", firstName: "Maybell", id: "1", favouriteColor: "#122a33", email: "Izaiah.Little@hotmail.com", jobTitle: "Customer Markets Architect", lastName: "Durgan", phone: "(927) 840-0095 x2527", longitude: 139.6922, latitude: 35.6897)
        person = PeopleTableViewCellViewModel(people: people)
      
        _ = sut.view
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //people = nil
         sut = nil
         cell = nil
         people = nil
         peopleModel = nil
         mockPeopleRepo = nil
         mockVMRoute = nil
         baseNetWorkProtocol = nil
    }
    
    func testPeopleViewController_WhenCreated_HasRequiredTableView() throws {
        XCTAssertNotNil(sut.tableview, "Controller should have a tableview")
        XCTAssertEqual(.none, sut.tableview.separatorStyle)
    }
    
    func testPeopleTableViewCellViewModel() {
        // what is it that we want to test?
        //XCTAssertEqual(cell.fullNameLabel.text!, sut.fullName)
        
        
    }
    
    func testCellForRow() {
        sut.tableview.register(UINib(nibName: PeopleTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier:  PeopleTableViewCell.Identifier)
        let cell = sut.tableview.dequeueReusableCell(withIdentifier: PeopleTableViewCell.Identifier)
        XCTAssertNotNil(cell,"TableView should be able to dequeue cell with identifier: '\(PeopleTableViewCell.Identifier)'")

    }
    

    
    func testCustomCell() throws {
            let customCell: PeopleTableViewCell = sut.tableview.dequeueReusableCell()
            XCTAssertNotNil(customCell, "No Custom Cell Available")
        //let imageViewer = try XCTUnwrap(customCell.imageViewer, "The customCell is not connected to an IBOutlet")
        
        let fullNameLabel = try XCTUnwrap(customCell.fullNameLabel, "The customCell is not connected to an IBOutlet")
        let emailLabel = try XCTUnwrap(customCell.emailLabel, "The customCell is not connected to an IBOutlet")
        let jobTitleLabel = try XCTUnwrap(customCell.jobTitleLabel, "The customCell is not connected to an IBOutlet")
        let cardView = try XCTUnwrap(customCell.cardView, "The customCell is not connected to an IBOutlet")
        XCTAssertEqual(fullNameLabel.text, "", "Full Name Label was not empty when the view controller initially loaded")
        XCTAssertEqual(emailLabel.text, "", "Email Label was not empty when the view controller initially loaded")
        XCTAssertEqual(jobTitleLabel.text, "", "Job Title Label was not empty when the view controller initially loaded")
        XCTAssertEqual(cardView.shadowColor, .none, "Card View ShadowColor was .none when the view controller initially loaded")
        
        customCell.config(person)
        XCTAssertEqual(fullNameLabel.text, person.fullName, "Full Name Label suppose  to  be equal to the value of person full name")
        XCTAssertEqual(emailLabel.text, person.email, "Email Label  suppose  to  be equal to the value of person Email")
        XCTAssertEqual(jobTitleLabel.text, person.jobTitle, "Job Title Label  suppose  to  be equal to the value of person Job Title")
        
        XCTAssertEqual(cardView.shadowColor, UIColor.colorFromHexString(person.favouriteColor), "Card View ShadowColor suppose  to  be equal to the value of person favourite color")
        }
    

    
//    func testGetPeople() {
//        // Arrange
//        baseNetWorkProtocol = MockPeopleNetwork()
//        mockVMRoute = MockVMRoute(baseNetwork: baseNetWorkProtocol)
//        mockPeopleRepo = MockPeopleRepo(vmRouteProtocol: mockVMRoute)
//       let mockPeopleViewModel = MockPeopleViewModel(peopleRepo: mockPeopleRepo)
//        sut.peopleViewModel = mockPeopleViewModel
//        // Act
//        sut.viewDidLoad()
//        XCTAssertTrue(mockPeopleViewModel.isGetPeopleMethodCalled, "The processUserSignup() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
//    }
}
