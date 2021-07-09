//
//  RoomViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class RoomViewController: BaseViewController {
    
    var validateDisposable: Disposable?
    var roomViewModel: IRoomViewModel?
    var rooms = [VMRoomResponse]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Room"
        // Do any additional setup after loading the view.
        print("room.createdAt")
        roomViewModel?.getRoom()
        validateDisposable = roomViewModel?.roomResponses.subscribe({  [weak self] (response) in
            if let res = response.element {
                self?.rooms = res
                self?.rooms.forEach { room in
                    print(room.createdAt)
                }
                
            }
            
        })
    }
    


}
