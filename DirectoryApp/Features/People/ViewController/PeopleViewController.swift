//
//  SecondViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift
import RxCocoa


class PeopleViewController: BaseViewController {
    var validateDisposable: Disposable?
    @IBOutlet weak var tableview: UITableView!
    var peopleViewModel: IPeopleViewModel?
    override func getViewModel() -> BaseViewModel {
        return self.peopleViewModel as! BaseViewModel 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getPeople()
        tableview.separatorStyle = .none
        tableview.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "PeopleTableViewCell")
    }
    
    
    
    func getPeople()  {
        title = "People"
        
        peopleViewModel?.getPeople()

        self.validateDisposable  = peopleViewModel?.peopleResponses.bind(to: self.tableview.rx.items) {  (tableView, indexPath, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell") as? PeopleTableViewCell
            cell?.config(element)
            return cell!
        }
     
    }
    
    
    
    
    
}
