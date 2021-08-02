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
    var fetchingMore = false
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
       
        if peopleViewModel?.peopleResponses != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showAlert(message: "Click on Profile view Location", type: .info)
            }
        }
        peopleViewModel?.getPeople()
        self.validateDisposable  = peopleViewModel?.peopleResponses.observeOn(MainScheduler.instance).bind(to: self.tableview.rx.items) {[weak self]  (tableView, index, element) in
          
            let cell: PeopleTableViewCell = tableView.dequeueReusableCell()
            cell.config(element)
            self?.location.latitude = element.latitude
            self?.location.longitude = element.longitude
            cell.addTapGesture {
                let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.PeopleLoacationViewController , requestData: self?.location)
            }
            return cell
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offSetY > contentHeight - scrollView.frame.height {
            if !fetchingMore {
                beginBatchFetch()
            }
            
        }

    }
    
    
    func beginBatchFetch()  {
        fetchingMore = true
        print("fetch more data")
    }
    
    
    
    
}
