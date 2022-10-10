//
//  CustomTextField.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 10.10.2022.
//

import UIKit
class CustomTextField: UITextField {
    
    init(placeholder: String ,isSecure: Bool? = false) {
        super.init(frame: .zero)
        borderStyle = .none
        textColor = .white
        backgroundColor = UIColor(white: 1, alpha: 0.2)
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        layer.cornerRadius = 5
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor(white: 1, alpha: 0.7)])
        let spacer = UIView()
        spacer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        spacer.widthAnchor.constraint(equalToConstant: 12).isActive = true
        leftView = spacer
        leftViewMode = .always
        isSecureTextEntry = isSecure!
        keyboardAppearance = .dark
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
