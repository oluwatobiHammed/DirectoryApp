//
//  PeopleViewModel.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 28/07/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class PeopleViewModelTests: XCTestCase {
    
    var peopleModel: VMPeopleResponse!
    var mockPeopleRepo: MockPeopleRepo!
    var mockVMRoute: MockVMRoute!
    var sut: PeopleViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockVMRoute = MockVMRoute()
        mockPeopleRepo =  MockPeopleRepo(vmRouteProtocol: mockVMRoute)
        sut = PeopleViewModel(peopleRepo: mockPeopleRepo)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockVMRoute = nil
        mockPeopleRepo = nil
        sut = nil
    }
    
    
    func testPeopleViewModel_WhenLoaded_ShouldCallGetPeopleMethod() {
        // Arrange

        // Act
        sut.getPeople()
        
        // Assert
        XCTAssertTrue(mockPeopleRepo.isGetPeopleMethodCalled, "The getPeople() method was not called in the PeopleViewModel class")
    }
    

}