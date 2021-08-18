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
    //var PeopleRepo: IPeopleRepo!
    var vmRoute: VMRouteProtocol!
    var peopleRepo: PeopleRepoImpl!
    var baseNetwork: BaseNetWorkProtocol!
    var mockBaseNetwork: BaseNetWorkProtocol!
    var disposeBag: DisposeBag!
    var sut: PeopleViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        baseNetwork = BaseNetWorkServices()
        vmRoute = VMRoute(baseNetwork: baseNetwork)
        peopleRepo =  PeopleRepoImpl(vmRouteProtocol: vmRoute)
        sut = PeopleViewModel(peopleRepo: peopleRepo)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vmRoute = nil
        peopleRepo = nil
        disposeBag = nil
        vmRoute = nil
        baseNetwork = nil
        sut = nil
    }
    
    
    func testPeopleViewModel_WhenLoaded_ShouldCallGetPeopleMethod() {
     
        // Arrange
        var isGetPeopleMethodCalled: Bool = false
        //let expectation = expectation(description:"friendCells contains a normal cell")
        // Act
        //sut.getPeople()
        sut.peopleRepo.getPeople().subscribe(onNext: {
           
            if let _ = $0.data {
                print($0.data!)
                isGetPeopleMethodCalled = true
                
            }else  {
                isGetPeopleMethodCalled = false
                
            }
            XCTAssertTrue(isGetPeopleMethodCalled)
            //expectation.fulfill()
        }).disposed(by: disposeBag)
        
        // Assert
        //wait(for: [expectation], timeout:0.1)
    }
    

        func testPeopleRepo() {
            // Arrange
            sut.getPeople()
            //XCTAssertTrue(mockPeopleRepo.isGetPeopleMethodCalled, "The getPeople() method was not called in the PeopleViewModel class")
            //XCTAssertTrue(sut.isGetPeopleMethodCalled, "The getPeople() method was not called in the PeopleViewModel class")
        }
}
