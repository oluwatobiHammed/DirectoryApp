//
//  RoomTableViewCellTest.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 08/08/2021.
//

import XCTest
@testable import DirectoryApp
class RoomTableViewCellTest: XCTestCase {
    
    var cell:PeopleTableViewCell!
    var roomRes: VMRoomResponse!
    var peopleModel: VMPeopleResponse!
    var mockRoomRepo: MockRoomRepo!
    var mockVMRoute: MockVMRoute!
    var baseNetWorkProtocol: MockPeopleNetwork!
    var storyboard: UIStoryboard!
    var sut: RoomViewController!
    var room: RoomCellViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "RoomViewController") as RoomViewController
        roomRes = VMRoomResponse(id: "", createdAt: "", name: "", maxOccupancy: 0, isOccupied: false)
        room = RoomCellViewModel(room: roomRes)
        //sut.tableview.delegate = nil
        //sut.tableview.dataSource = nil
        _ = sut.view
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //people = nil
         sut = nil
         cell = nil
         room = nil
         peopleModel = nil
         mockRoomRepo = nil
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
//
//    func testTableViewDelegateIsViewController() {
//      XCTAssertTrue(sut.tableview.delegate === sut,
//                    "Controller should be delegate for the table view")
//    }
    
    func testCustomCell() throws {
            let customCell: RoomTableViewCell = sut.tableview.dequeueReusableCell()
            XCTAssertNotNil(customCell, "No Custom Cell Available")
        
        let nameLabel = try XCTUnwrap(customCell.nameLabel, "The customCell is not connected to an IBOutlet")
        let capacityLabel = try XCTUnwrap(customCell.capacityLabel, "The customCell is not connected to an IBOutlet")
        let isOccupiedLabel = try XCTUnwrap(customCell.isOccupiedLabel, "The customCell is not connected to an IBOutlet")
        let containerUIView = try XCTUnwrap(customCell.containerUIView, "The customCell is not connected to an IBOutlet")
        XCTAssertEqual(nameLabel.text, "", "Full Name Label was not empty when the view controller initially loaded")
        XCTAssertEqual(capacityLabel.text, "", "Email Label was not empty when the view controller initially loaded")
        XCTAssertEqual(isOccupiedLabel.text, "", "Job Title Label was not empty when the view controller initially loaded")
        XCTAssertEqual(containerUIView.shadowColor, .none, "Card View ShadowColor was .none when the view controller initially loaded")
        
        customCell.configRoom(room)
        XCTAssertEqual(nameLabel.text, room.name, "Full Name Label suppose  to  be equal to the value of person full name")
        XCTAssertEqual(capacityLabel.text, room.capacity, "Email Label  suppose  to  be equal to the value of person Email")
        XCTAssertEqual(isOccupiedLabel.text, room.isAvailable, "Job Title Label  suppose  to  be equal to the value of person Job Title")
        
        XCTAssertEqual(containerUIView.shadowColor, room.containerColor, "Card View ShadowColor suppose  to  be equal to the value of person favourite color")
        }
    

    
//    func testGetPeople() {
//        // Arrange
//        baseNetWorkProtocol = MockPeopleNetwork()
//        mockVMRoute = MockVMRoute(baseNetwork: baseNetWorkProtocol)
//        mockRoomRepo = MockRoomRepo(vmRouteProtocol: mockVMRoute)
//        let mockRoomViewModel = MockRoomViewModel(roomRepo: mockRoomRepo)
//        sut.roomViewModel = mockRoomViewModel
//       
//        // Act
//        sut.viewDidLoad()
//        XCTAssertTrue(mockRoomViewModel.isGetPeopleMethodCalled, "The processUserSignup() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
//    }
}

