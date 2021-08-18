//
//  RoomViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 07/08/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class RoomViewModelTests: XCTestCase {
    var roomModel: VMRoomResponse!
    var mockRoomRepo: MockRoomRepo!
    var mockVMRoute: MockVMRoute!
    var baseNetWorkProtocol: BaseNetWorkProtocol!
    var sut: RoomViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        baseNetWorkProtocol = BaseNetWorkServices()
        mockVMRoute = MockVMRoute(baseNetwork: baseNetWorkProtocol)
        mockRoomRepo =  MockRoomRepo(vmRouteProtocol: mockVMRoute)
        sut = RoomViewModel(roomRepo: mockRoomRepo)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockVMRoute = nil
        mockRoomRepo = nil
        sut = nil
    }
    
    
    func testPeopleViewModel_WhenLoaded_ShouldCallGetPeopleMethod() {
        // Arrange

        // Act
        sut.getRoom()
        
        // Assert
        XCTAssertTrue(mockRoomRepo.isGetPeopleMethodCalled, "The getRoom() method was not called in the PeopleViewModel class")
    }

}
