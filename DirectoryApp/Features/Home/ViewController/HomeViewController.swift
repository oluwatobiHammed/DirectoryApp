//
//  ViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        title = "Home"
        
        
        
        
    }

    @IBAction func SecondViewButtonTapped(_ sender: UIButton) {
        let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.SecondViewController , requestData: nil)
        //peopleViewModel?.getPeople()
//                validateDisposable = VMDatasource.shared.getPeopleResult().subscribe(onNext: { (response) in
//                    //self.setLinker()
//                    print(response?.count)
//                }, onError: { (error) in
//                   print(error)
//                }, onCompleted: {
//
//                })
    }
    @IBAction func thirdButtonViewTapped(_ sender: UIButton) {
        let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.RoomViewController , requestData: nil)
    }
    
}

