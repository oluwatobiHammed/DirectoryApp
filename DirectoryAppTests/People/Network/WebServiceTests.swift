//
//  PeopleWebServiceTests.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 29/07/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class WebServiceTests: XCTestCase {
    var sut: VMRoute!
    var disposeBag: DisposeBag!
    var peopleResponses: PublishSubject<[VMPeopleResponse]>!
    var baseNetwork: BaseNetWorkProtocol!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        disposeBag = DisposeBag()
        peopleResponses  = PublishSubject()
        baseNetwork = BaseNetWorkServices()
        sut = VMRoute(baseNetwork: baseNetwork, urlSession: config)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        disposeBag = nil
        baseNetwork = nil
        
    }
    
    func testPeopleWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        MockURLProtocol.requestHandler = { request in
         
            let response = HTTPURLResponse.init(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)!
            return (response, Bundle.main.decode(from: "response.txt"))
        }
        let expectation = self.expectation(description: "getPeople Web Service Response Expectation")
        // Act
        sut.getPeople(urlString: RemoteApiConstants.Endpoints.getPeople.stringValue).subscribe { res in
            // Assert
            print("code excuted")
            XCTAssertEqual(res.data?.first?.avatar, "https://randomuser.me/api/portraits/women/13.jpg")
            expectation.fulfill()
        } onError: { err in
            
        }.disposed(by: disposeBag)
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testPeopleWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
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
        let expectation = self.expectation(description: "GetPeople() method expectation for a response that contains a different JSON structure")
        // Act
        sut.getPeople(urlString: RemoteApiConstants.Endpoints.getPeople.stringValue).subscribe { res in
            // Assert
            
            res.data?.forEach({ res in
                XCTAssertNil(res.avatar, "The response model for a request containing unknown JSON response, should have been nil")
            })
            expectation.fulfill()
        } onError: { error in
            XCTAssertEqual(error.localizedDescription, "The response model for a request containing unknown JSON response", "The GetPeople() method did not return expected error")
        }.disposed(by: disposeBag)
        self.wait(for: [expectation], timeout: 5)
    }


    
     func testGetPeopleWebservice_WhenEmptyURLStringProvided_ReturnsError() {
      
        // Arrange
        let urlString = ""
        let expectation = self.expectation(description: "An empty request URL string expectation")
        // Act
        print("code excuted")
        sut.getPeople(urlString: urlString).subscribe { res in
           
            // Assert
            res.data!.forEach({ res in
                XCTAssertNil(res.avatar, "When an invalidRequestURLString takes place, the response model must be nil")
                
            })
            expectation.fulfill()
        } onError: { error in
            XCTAssertEqual(error.localizedDescription, "URL is not valid: ", "The getPeople() method did not return an expected error for an invalidRequestURLString error")
            expectation.fulfill()
        }.disposed(by: disposeBag)
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testGetPeopleWebservice_WhenIncorrectURLStringProvided_ReturnsError() {

        // Arrange
        let urlString = "https://pastebin.com/raw/kg02"
        let expectation = self.expectation(description: "An incorrect request URL string expectation")

        // Act
        sut.getPeople(urlString: urlString).subscribe { res in
            print("code excuted")
            // Assert
            res.data!.forEach({ res in
                XCTAssertNil(res, "The data couldn’t be read because it isn’t in the correct format, the response model must be nil")
            })
            expectation.fulfill()
        } onError: { error in
            print("code excuted")
            XCTAssertEqual(error.asAFError.debugDescription, "The data couldn’t be read because it isn’t in the correct format", "The getPeople() method did not return an expected error for an invalidRequestURLString error")
            expectation.fulfill()

        }.disposed(by: disposeBag)

        self.wait(for: [expectation], timeout: 2)
    }
    


}
