//
//  AuthButton.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 10.10.2022.
//

import UIKit

class AuthButton: UIButton {
    init(title: String, type: ButtonType) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        isEnabled = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
