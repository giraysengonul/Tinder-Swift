//
//  BottomControlsStackView.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 30.08.2022.
//

import UIKit
class BottomControlsStackView: UIStackView {
    // MARK: - Properties
    private let refreshButton = UIButton(type: .system)
    private let dislikeButton = UIButton(type: .system)
    private let superlikeButton = UIButton(type: .system)
    private let likeButton = UIButton(type: .system)
    private let boostButton = UIButton(type: .system)
    
    
    // MARK: - Lifecyle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension BottomControlsStackView{
    private func style(){
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        //stackView Style
        [refreshButton, dislikeButton, superlikeButton, likeButton, boostButton].forEach { view in
            addArrangedSubview(view)
        }
        axis = .horizontal
        distribution = .fillEqually
        //refreshButton Style
        let refreshButtonImage = #imageLiteral(resourceName: "refresh_circle").withRenderingMode(.alwaysOriginal)
        refreshButton.setImage(refreshButtonImage, for: .normal)
        //dislikeButton Style
        let dislikeButtonImage = #imageLiteral(resourceName: "dismiss_circle").withRenderingMode(.alwaysOriginal)
        dislikeButton.setImage(dislikeButtonImage, for: .normal)
        //settingButton Style
        let superlikeButtonImage = #imageLiteral(resourceName: "super_like_circle").withRenderingMode(.alwaysOriginal)
        superlikeButton.setImage(superlikeButtonImage, for: .normal)
        //messageButton Style
        let likeButtonImage = #imageLiteral(resourceName: "like_circle").withRenderingMode(.alwaysOriginal)
        likeButton.setImage(likeButtonImage, for: .normal)
        //settingButton Style
        let boostButtonImage = #imageLiteral(resourceName: "boost_circle").withRenderingMode(.alwaysOriginal)
        boostButton.setImage(boostButtonImage, for: .normal)
        
        
        
    }
}
