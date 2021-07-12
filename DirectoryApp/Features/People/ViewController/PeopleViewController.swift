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
    var location = Location()
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showAlert(message: "Click on Profile view Location", type: .info)
        }
        
        peopleViewModel?.getPeople()

        self.validateDisposable  = peopleViewModel?.peopleResponses.bind(to: self.tableview.rx.items) {[weak self]  (tableView, index, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell") as? PeopleTableViewCell
            cell?.config(element)
            self?.location.latitude = element.latitude
            self?.location.longitude = element.longitude
            cell?.addTapGesture {
                let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.PeopleLoacationViewController , requestData: self?.location)
            }
            return cell!
        }
     
    }
    
    
    
    
    
}
