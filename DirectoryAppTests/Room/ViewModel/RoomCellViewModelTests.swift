//
//  RoomCellViewModelTests.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 03/08/2021.
//

import XCTest
@testable import DirectoryApp

class RoomCellViewModelTests: XCTestCase {

    var room: VMRoomResponse!
    var sut: RoomCellViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        room = VMRoomResponse(id: "1", createdAt: "2020-12-14T12:12:29.677Z", name: "Megaman", maxOccupancy: 10, isOccupied: true)
        sut = RoomCellViewModel(room: room)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        room = nil
        sut = nil
    }
    
    func testRoomTableViewCellViewModel() {
        // what is it that we want to test?
        XCTAssertEqual("Room Name: \(String(describing: room.name!))", sut.name)
        XCTAssertEqual("Rooom Unavailable", sut.isAvailable)
        XCTAssertEqual("Room Capacity: \(room.maxOccupancy!)", sut.capacity)
        XCTAssertEqual(ThemeManager.currentTheme().dangerColor , sut.containerColor)
    }

    
    func testRoomTableViewCellViewModel_isAvalableIsFalse() {
        // what is it that we want to test?
        room = VMRoomResponse(id: "1", createdAt: "2020-12-14T12:12:29.677Z", name: "Megaman", maxOccupancy: 10, isOccupied: false)
        sut = RoomCellViewModel(room: room)
       
        XCTAssertEqual("Room Available", sut.isAvailable)
        XCTAssertEqual(ThemeManager.currentTheme().sucessColor , sut.containerColor)
    }
}
