//
//  RoomInjections.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import Swinject
import SwinjectStoryboard

class RoomInjections {
    static func setup(container: Container) {
        container.register(VMRouteProtocol.self) { _ in VMRoute(config: .default) }
        container.register(IRoomRepo.self) { res in
            RoomRepoImpl(vmRouteProtocol: res.resolve(VMRouteProtocol.self)!)
        }
        container.register(IRoomViewModel.self) { res in
            RoomViewModel(roomRepo: res.resolve(IRoomRepo.self)!)
        }
        container.register(RoomViewModel.self) { res in
            RoomViewModel(roomRepo: res.resolve(IRoomRepo.self)!)
        }
        
        
        // MARK: - Storyboard
        container.storyboardInitCompleted(RoomViewController.self) { (res, cntrl) in
            cntrl.roomViewModel = res.resolve(IRoomViewModel.self)
        }
        
        container.storyboardInitCompleted(RoomViewController.self) { (res, cntrl) in
            cntrl.roomViewModel = res.resolve(RoomViewModel.self)
        }
        
      
    }
}
