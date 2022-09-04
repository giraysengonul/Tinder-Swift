//
//  HomeController.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 27.08.2022.
//

import UIKit
class HomeController: UIViewController {
    // MARK: - Properties
    private var stackView = UIStackView()
    private let topStack = HomeNavigationStackView()
    private let bottomStack = BottomControlsStackView()
    private let deckView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        configureCards()
    }
    
}
// MARK: - Helpers
extension HomeController{
    private func style(){
        view.backgroundColor = .white
        //stackView Style
        [topStack, deckView, bottomStack].forEach { view in
            stackView.addArrangedSubview(view)
        }
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        stackView.bringSubviewToFront(deckView)
    }
    private func layout(){
        //topStack Layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    private func configureCards(){
        let card1 = CardView()
        let card2 = CardView()
        card1.translatesAutoresizingMaskIntoConstraints = false
        deckView.addSubview(card1)
        card1.leadingAnchor.constraint(equalTo: deckView.leadingAnchor).isActive = true
        card1.trailingAnchor.constraint(equalTo: deckView.trailingAnchor).isActive = true
        card1.bottomAnchor.constraint(equalTo: deckView.bottomAnchor).isActive = true
        card1.topAnchor.constraint(equalTo: deckView.topAnchor).isActive = true
        
    }
}
