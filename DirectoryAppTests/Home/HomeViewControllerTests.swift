//
//  ViewControllerTests.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 08/08/2021.
//

import XCTest
@testable import DirectoryApp
class HomeViewControllerTests: XCTestCase {
    
    
    
    var storyboard: UIStoryboard!
    var sut: HomeViewController!
   
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "HomeViewController") as HomeViewController
        _ = sut.view
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //people = nil
         sut = nil
         storyboard = nil
    }
    
    
    func testViewController_WhenCreated_HasPeopleButtonAndAction() throws {
        // Arrange
        let peopleButton: UIButton = try XCTUnwrap(sut.peopleButton, "Signup button does not have a referencing outlet")
        
        // Act
        let peopleButtonActions = try XCTUnwrap(peopleButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "People button does not have any actions assigned to it")
        sut.peopleButton.sendActions(for: .touchUpInside)
        // Assert
        XCTAssertEqual(peopleButtonActions.count, 1)
        XCTAssertEqual(peopleButtonActions.first, "PeopleButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
        
    }
 
    func testViewController_WhenCreated_HasRoomButtonAndAction() throws {
        // Arrange
        let roomButton: UIButton = try XCTUnwrap(sut.roomButton, "Signup button does not have a referencing outlet")
        
        // Act
        let roomButtonActions = try XCTUnwrap(roomButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "People button does not have any actions assigned to it")
        sut.peopleButton.sendActions(for: .touchUpInside)
        // Assert
        XCTAssertEqual(roomButtonActions.count, 1)
        XCTAssertEqual(roomButtonActions.first, "roomButtonViewTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
        
        
    }
    


    
  
    


}
