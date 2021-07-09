//
//  MainCoordinator.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
//        navigationController.delegate = self
//        let vc = HomeController.instantiate()
//        vc.coordinator = self
//        navigationController.setViewControllers([vc], animated: true)
    }
    
    func secondView () {
        let child = SecondCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func thirdView()  {
        let child = ThirdCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()

    }
    
    func childDidFinished(_ child: Coordinator?)  {
        for (index, coordinator) in
            childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
            
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let secondViewController  = fromViewController  as? PeopleViewController {
            //childDidFinished(secondViewController.coordinator)
        }
    }
    
    
}
