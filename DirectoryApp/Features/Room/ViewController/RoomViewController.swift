//
//  RoomViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 08/07/2021.
//

import UIKit
import RxSwift
import RxCocoa
import ProgressHUD

class RoomViewController: BaseViewController {
    
    var validateDisposable: Disposable?
    var roomViewModel: IRoomViewModel?
    var rooms = [VMRoomResponse]()
    //var reustableTable: GenericTableView<VMRoomResponse, UITableViewCell>?
    
    override func getViewModel() -> BaseViewModel {
        return self.roomViewModel as! BaseViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Room"
       
        // Do any additional setup after loading the view.
        roomViewModel?.getRoom()
        self.validateDisposable = roomViewModel?.roomResponses.bind(onNext:  {  [weak self] (response) in
            //self?.reustableTable?.reload(data: response)
            //GenericTableView(frame: view.frame, source: response)
        })
        setupTable()
    }
    
    func setupTable() {
//        reustableTable = GenericTableView(frame: view.frame, items: rooms, config: { (item, cell) in
//            if let rooms = item.id {
//                cell.textLabel?.text = "\(rooms)"
//            }
//        }, selectHandler: { (item) in
//            print(item)
//        })
//        view.addSubview(reustableTable!)
    }
    
}
