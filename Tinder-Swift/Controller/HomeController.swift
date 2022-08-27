//
//  HomeController.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 27.08.2022.
//

import UIKit
class HomeController: UIViewController {
     // MARK: - Properties
    
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}
 // MARK: - Helpers
extension HomeController{
    private func style(){
        view.backgroundColor = .blue
    }
    private func layout(){
        
    }
}
