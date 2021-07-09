//
//  SecondViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift

class PeopleViewController: UIViewController {
    var validateDisposable: Disposable?
    var peopleViewModel: IPeopleViewModel?
    var people = [VMPeopleResponse]()
    var reustableTable: GenericTableView<VMPeopleResponse, UITableViewCell>?
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second"
        view.backgroundColor = .systemGreen
        
        view.backgroundColor = .red
        title = "Home"
        
        peopleViewModel?.getPeople()
        validateDisposable = peopleViewModel?.peopleResponses.subscribe({  [weak self] (response) in
            if let res = response.element {
                self?.people.append(contentsOf:res)
                guard let peop = self?.people else {
                    return
                }
                self?.reustableTable?.reload(data: peop)
                
            }
            
        })
        
        setupTable()
    }
    
    func setupTable() {
        reustableTable = GenericTableView(frame: view.frame, items: people, config: { (item, cell) in
            cell.textLabel?.text = item.avatar
        }, selectHandler: { (item) in
            print(item)
        })
        
        view.addSubview(reustableTable!)
    }
    

   

}
