//
//  MockPeopleRepo.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 28/07/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class MockPeopleRepo: IPeopleRepo {
    var isGetPeopleMethodCalled: Bool = false
    
    let vmRouteProtocol: VMRouteProtocol?
   
   
    init(vmRouteProtocol: VMRouteProtocol) {
       self.vmRouteProtocol = vmRouteProtocol
       
   }
    
    func getPeople() -> Observable<ApiResponse<[VMPeopleResponse]>> {
        
        isGetPeopleMethodCalled = true
        return vmRouteProtocol!.getPeople(urlString: RemoteApiConstants.Endpoints.getPeople.stringValue)
    }

}
