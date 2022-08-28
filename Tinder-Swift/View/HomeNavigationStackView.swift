//
//  HomeNavigationStackView.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 28.08.2022.
//

import UIKit
class HomeNavigationStackView: UIStackView {
    // MARK: - Properties
    private let settingsButton = UIButton(type: .system)
    private let messageButton = UIButton(type: .system)
    private let tinderIcon = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
    
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
extension HomeNavigationStackView{
    private func style(){
        //stackView Style
        [settingsButton, UIView(), tinderIcon, UIView(), messageButton].forEach { view in
            addArrangedSubview(view)
        }
        axis = .horizontal
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        //settingButton Style
        let settingButtonImage = #imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal)
        settingsButton.setImage(settingButtonImage, for: .normal)
        //messageButton Style
        let messageButtonImage = #imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysOriginal)
        messageButton.setImage(messageButtonImage, for: .normal)
        
        
    }
    
}
