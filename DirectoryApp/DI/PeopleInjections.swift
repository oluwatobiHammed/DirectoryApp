//
//  PeopleInjections.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import Foundation
import Swinject
import SwinjectStoryboard

class PeopleInjections {
    static func setup(container: Container) {
        container.register(BaseNetWorkProtocol.self) { _ in
            BaseNetWorkServices() }
        container.register(VMRouteProtocol.self) { res in
            VMRoute(baseNetwork: res.resolve(BaseNetWorkProtocol.self)!) }
        container.register(IPeopleRepo.self) { res in
            PeopleRepoImpl(vmRouteProtocol: res.resolve(VMRouteProtocol.self)!)
        }
        container.register(PeopleRepoImpl.self) { res in
            PeopleRepoImpl(vmRouteProtocol: res.resolve(VMRouteProtocol.self)!)
        }
        container.register(IPeopleViewModel.self) { res in
            PeopleViewModel(peopleRepo: res.resolve(IPeopleRepo.self)!)
        }
        container.register(PeopleViewModel.self) { res in
            PeopleViewModel(peopleRepo: res.resolve(IPeopleRepo.self)!)
        }
        
        
        // MARK: - Storyboard
        container.storyboardInitCompleted(PeopleViewController.self) { (res, cntrl) in
            cntrl.peopleViewModel = res.resolve(IPeopleViewModel.self)
        }
        
        container.storyboardInitCompleted(PeopleViewController.self) { (res, cntrl) in
            cntrl.peopleViewModel = res.resolve(PeopleViewModel.self)
        }
        
      
    }
}
