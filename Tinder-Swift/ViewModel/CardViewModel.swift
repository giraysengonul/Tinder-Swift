//
//  CardViewModel.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 20.09.2022.
//

import UIKit

class CardViewModel {
    let user: User
    let userInfoText: NSAttributedString
    private var imageIndex = 0
    var imageToShow: UIImage?
    init(user: User) {
        self.user = user
        let attributedText = NSMutableAttributedString(string: user.name,
                                                       attributes: [.foregroundColor : UIColor.white , .font : UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedText.append(NSAttributedString(string: "  \(user.age)",
                                                 attributes: [.foregroundColor : UIColor.white, .font : UIFont.systemFont(ofSize: 24)]))
        self.userInfoText = attributedText
    }
    func showNextPhoto(){
        if imageIndex >= user.images.count - 1{ return }
        imageIndex += 1
        imageToShow = user.images[imageIndex]
        
    }
    func showPreviousPhoto(){
        if imageIndex <= 0 { return }
        imageIndex -= 1
        imageToShow = user.images[imageIndex]
    }
}
