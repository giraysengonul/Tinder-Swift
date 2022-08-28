//
//  HomeController.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 27.08.2022.
//

import UIKit
class HomeController: UIViewController {
    // MARK: - Properties
    private let topStack = HomeNavigationStackView()
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
        view.backgroundColor = .white
        //topStack Style
        topStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topStack)
        
    }
    private func layout(){
        //topStack Layout
        NSLayoutConstraint.activate([
            topStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: topStack.trailingAnchor)
        ])
    }
}
