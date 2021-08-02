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
    
    @IBOutlet weak var tableview: UITableView!
    var validateDisposable: Disposable?
    var roomViewModel: IRoomViewModel?
    var rooms = [VMRoomResponse]()
    //var reustableTable: GenericTableView<VMRoomResponse, UITableViewCell>?
    
    override func getViewModel() -> BaseViewModel {
        return self.roomViewModel as! BaseViewModel
    }
    private lazy var jsonDecoder = JSONDecoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Room"
        tableview.contentInsetAdjustmentBehavior = .never
        // Do any additional setup after loading the view.
        
        getRoom()
        tableview.separatorStyle = .none
        tableview.register(UINib(nibName: RoomTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: RoomTableViewCell.Identifier)
    }
    
 
    func getRoom()  {
        roomViewModel?.getRoom()
        self.validateDisposable = roomViewModel?.roomResponses.observeOn(MainScheduler.instance).bind(to: self.tableview.rx.items) {  (tableView, index, element) in
            let cell:RoomTableViewCell = tableView.dequeueReusableCell()
            cell.configRoom(element)
            return cell
        }

    }
}
