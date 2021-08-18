//
//  RoomWebServiceTests.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 08/08/2021.
//

import Foundation
import XCTest
import RxSwift
@testable import DirectoryApp

class RoomWebServiceTests: XCTestCase {
    var sut: VMRoute!
    var disposeBag: DisposeBag!
    var roomResponses: PublishSubject<[VMRoomResponse]>!
    var baseNetwork: BaseNetWorkProtocol!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        disposeBag = DisposeBag()
        roomResponses  = PublishSubject()
        baseNetwork = BaseNetWorkServices()
        sut = VMRoute(baseNetwork: baseNetwork, urlSession: config)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        disposeBag = nil
        baseNetwork = nil
        
    }
    
    func testRoomWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        MockURLProtocol.requestHandler = { request in
         
            let response = HTTPURLResponse.init(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!
            return (response, Bundle.main.decode(from: "roomResponse.txt"))
        }
        let expectation = self.expectation(description: "getRoom Web Service Response Expectation")
        // Act
        sut.getRoom(urlString: RemoteApiConstants.Endpoints.getRoom.stringValue).subscribe { res in
            // Assert
            XCTAssertEqual(res.data?.first?.name, "Megaman")
            expectation.fulfill()
        } onError: { err in
            
        }.disposed(by: disposeBag)
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testRoomWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let exampleData = """
    [{"base": "EUR",
      "date": "2018-04-08",
      "rates": {
        "CAD": 1.565,
        "CHF": 1.1798,
        "GBP": 0.87295,
        "SEK": 10.2983,
        "EUR": 1.092,
        "USD": 1.2234
      }
    }]
    """.data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
         
            let response = HTTPURLResponse.init(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!
            return (response, exampleData)
        }
        let expectation = self.expectation(description: "GetRoom() method expectation for a response that contains a different JSON structure")
        // Act
        sut.getRoom(urlString: RemoteApiConstants.Endpoints.getRoom.stringValue).subscribe { res in
            // Assert
            
            res.data?.forEach({ res in
                XCTAssertNil(res.name, "The response model for a request containing unknown JSON response, should have been nil")
            })
            expectation.fulfill()
        } onError: { error in
            XCTAssertEqual(error.localizedDescription, "The response model for a request containing unknown JSON response", "The GetPeople() method did not return expected error")
        }.disposed(by: disposeBag)
        self.wait(for: [expectation], timeout: 5)
    }


    
     func testGetRoomWebservice_WhenEmptyURLStringProvided_ReturnsError() {
      
        // Arrange
        let urlString = ""
        let expectation = self.expectation(description: "An empty request URL string expectation")
        // Act
        print("code excuted")
        sut.getRoom(urlString: urlString).subscribe { res in
           
            // Assert
            res.data!.forEach({ res in
                XCTAssertNil(res.name, "When an invalidRequestURLString takes place, the response model must be nil")
                
            })
            expectation.fulfill()
        } onError: { error in
            XCTAssertEqual(error.localizedDescription, "URL is not valid: ", "The getPeople() method did not return an expected error for an invalidRequestURLString error")
            expectation.fulfill()
        }.disposed(by: disposeBag)
        
        self.wait(for: [expectation], timeout: 2)
    }
    

    


}
