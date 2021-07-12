//
//  RoomRepoImpl.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import RxSwift


struct RoomRepoImpl: IRoomRepo {
  
    
 
     let vmRouteProtocol: VMRouteProtocol?
    
    
     init(vmRouteProtocol: VMRouteProtocol) {
        self.vmRouteProtocol = vmRouteProtocol
        
    }
    
    func getRoom() -> Observable<ApiResponse<[VMRoomResponse]>> {
        return vmRouteProtocol!.getRoom()
    }
   
    func getRoomFile() -> Observable<[VMRoomResponse]> {
        return vmRouteProtocol!.getRoomFile()
    }
}
