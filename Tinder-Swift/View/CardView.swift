//
//  CardView.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 4.09.2022.
//

import UIKit
class CardView: UIView {
    // MARK: - Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        let image = #imageLiteral(resourceName: "jane1")
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        
        return imageView
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Helpers
extension CardView{
    private func style(){
        backgroundColor = .systemPurple
        //imageView Style
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
    }
    private func layout(){
        //imageView layout
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
