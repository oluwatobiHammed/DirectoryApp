//
//  PeopleRepoImpl.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift


 struct PeopleRepoImpl: IPeopleRepo {
 
    private var vmRouteProtocol: VMRouteProtocol
     init(vmRouteProtocol: VMRouteProtocol) {
        self.vmRouteProtocol = vmRouteProtocol
    }
    
    func getPeople() -> Observable<ApiResponse<[VMPeopleResponse]>> {
        return vmRouteProtocol.getPeople(urlString: RemoteApiConstants.Endpoints.getPeople.stringValue)
    }
   
}
