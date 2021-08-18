//
//  MockRoomRepo.swift
//  DirectoryAppTests
//
//  Created by Oladipupo Oluwatobi on 08/08/2021.
//

import XCTest
import RxSwift
@testable import DirectoryApp

class MockRoomRepo: IRoomRepo {
   
    
    var isGetPeopleMethodCalled: Bool = false
    
    let vmRouteProtocol: VMRouteProtocol?
   
   
    init(vmRouteProtocol: VMRouteProtocol) {
       self.vmRouteProtocol = vmRouteProtocol
       
   }
    
    func getRoom() -> Observable<ApiResponse<[VMRoomResponse]>> {
        isGetPeopleMethodCalled = true
        return vmRouteProtocol!.getRoom(urlString: RemoteApiConstants.Endpoints.getRoom.stringValue)
    }
    
  

 

}
