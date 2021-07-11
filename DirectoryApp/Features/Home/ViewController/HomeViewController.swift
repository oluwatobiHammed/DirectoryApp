//
//  ViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 06/07/2021.
//

import UIKit
import RxSwift
import RxCocoa
import ProgressHUD
class HomeViewController: BaseViewController {
    @IBOutlet weak var peopleButton: UIButton!
    @IBOutlet weak var roomButton: UIButton!
    
    var homeViewModel: IHomeViewModel?

    override func getViewModel() -> BaseViewModel {
        return self.homeViewModel as? BaseViewModel ?? BaseViewModel()
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
        homeViewModel?.goHome()
        
    }

    @IBAction func SecondViewButtonTapped(_ sender: UIButton) {
        let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.SecondViewController , requestData: nil)
    }
    @IBAction func thirdButtonViewTapped(_ sender: UIButton) {
        let _ = StoryBoardsID.boardMain.requestNavigation(to: ViewControllerID.RoomViewController , requestData: nil)
    }
    
}

