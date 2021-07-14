//
//  SecondViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift
import RxCocoa


class PeopleViewController: BaseViewController, UIScrollViewDelegate, UITableViewDelegate {
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
        tableview.delegate = self
        tableview.separatorStyle = .none
        tableview.register(UINib(nibName: PeopleTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier:  PeopleTableViewCell.Identifier)
    }
    
    
    
    func getPeople()  {
        title = "People"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableview.contentInsetAdjustmentBehavior = .never
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showAlert(message: "Click on Profile view Location", type: .info)
        }
        
        peopleViewModel?.getPeople()

        self.validateDisposable  = peopleViewModel?.peopleResponses.observe(on: MainScheduler.instance).bind(to: self.tableview.rx.items) {[weak self]  (tableView, index, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier:  PeopleTableViewCell.Identifier) as? PeopleTableViewCell
            cell?.config(element)
            self?.location.latitude = element.latitude
            self?.location.longitude = element.longitude
            cell?.addTapGesture {
                let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.PeopleLoacationViewController , requestData: self?.location)
            }
            return cell!
        }
     
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position  > (tableview.contentSize.height-50-scrollView.frame.size.height ){
            print("fetch more data")
        }
    }
    
    
    
    
    
}
