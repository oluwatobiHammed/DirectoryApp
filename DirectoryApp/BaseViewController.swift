//
//  BaseViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift


class BaseViewController: UIViewController, ViewControllerPresentRequestDataReceiver,ViewControllerPresentedDidDisappear {
    var presentRequestData: Any?
    static var displayingViewController: UIViewController?
    var viewControllerWillDisappearData: Any?
    var disposeBag: DisposeBag? = DisposeBag()
    var didRemoveViewControllerSubject: PublishSubject<Any?>?
    var viewControllerPresenterDisposable: Disposable?
    var contactDisplayRequesterDisposable: Disposable?
    deinit {
        print("Disposing \(self)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BaseViewController.displayingViewController = self
        self.viewControllerPresenterDisposable?.dispose()
        self.viewControllerPresenterDisposable = ViewControllerPresenter.shared.presentViewControllerObserver.subscribe(onNext: { (request) in
            self.displayViewController(fromRequest: request)
        })
        
        if let dispose = disposeBag {
            self.contactDisplayRequesterDisposable?.disposed(by: dispose)
            self.viewControllerPresenterDisposable?.disposed(by: dispose)
        }
        
        DynamicViewControllerPathResolver.shared.presentNextViewController()
      
    }

    override func viewWillDisappear(_ animated: Bool) {
        BaseViewController.displayingViewController = nil
        self.viewControllerPresenterDisposable?.dispose()
         self.contactDisplayRequesterDisposable?.dispose()
        if self.isMovingFromParent {
            self.onRemovingFromParent()
            self.disposeBag = nil
        }
        //shareDisposable?.dispose()
    }

}
