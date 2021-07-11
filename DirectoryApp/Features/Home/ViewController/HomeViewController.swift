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
    @IBOutlet weak var peopleButton: UIButton!
    @IBOutlet weak var roomButton: UIButton!
    
    override func getViewModel() -> BaseViewModel {
        return  BaseViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Home"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "vm_bg")!)
        peopleButton.backgroundColor = ThemeManager.currentTheme().mainColor
        roomButton.backgroundColor = ThemeManager.currentTheme().mainColor
        peopleButton.roundEdges()
        roomButton.roundEdges()
        
    }
    
    @IBAction func SecondViewButtonTapped(_ sender: UIButton) {
        let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.SecondViewController , requestData: nil)
    }
    @IBAction func thirdButtonViewTapped(_ sender: UIButton) {
        let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.RoomViewController , requestData: nil)
    }
    
}

