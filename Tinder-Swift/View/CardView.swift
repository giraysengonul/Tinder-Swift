//
//  CardView.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 4.09.2022.
//

import UIKit

enum SwipeDirection: Int {
    case left = -1
    case right = 1
}

class CardView: UIView {
    // MARK: - Properties
    private let gradient = CAGradientLayer()
    private let viewModel: CardViewModel
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: "Jane Doe", attributes: [.foregroundColor : UIColor.white , .font : UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedText.append(NSAttributedString(string: "  20", attributes: [.foregroundColor : UIColor.white, .font : UIFont.systemFont(ofSize: 24)]))
        label.attributedText = attributedText
        return label
    }()
    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "info_icon")
        button.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    // MARK: - Lifecycle
    init(viewModel : CardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        style()
        layout()
        configureGestureRecognizers()
    }
    override func layoutSubviews() {
        gradient.frame = self.frame
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
        imageView.image = viewModel.user.images.first
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        //gradientLayer Added
        configureGradientLayer()
        //infoLabel Style
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(infoLabel)
        //infoButton Style
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(infoButton)
    }
    private func layout(){
        //imageView Layout
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        //infoLabel Layout
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: 16)
        ])
        //infoButton Style
        NSLayoutConstraint.activate([
            infoButton.heightAnchor.constraint(equalToConstant: 40),
            infoButton.widthAnchor.constraint(equalToConstant: 40),
            infoButton.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor),
            trailingAnchor.constraint(equalTo: infoButton.trailingAnchor, constant: 16)
        ])
    }
    
    private func configureGradientLayer(){
        gradient.locations = [0.5 , 1.1]
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        layer.addSublayer(gradient)
    }
    func configureGestureRecognizers(){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        addGestureRecognizer(pan)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleChangePhoto))
        addGestureRecognizer(tap)
    }
    func resetCardPosition(_ sender: UIPanGestureRecognizer) {
        let direction: SwipeDirection = sender.translation(in: nil).x > 100 ? .right : .left
        let shouldDismissCard = abs(sender.translation(in: nil).x) > 100
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                let xDirection = CGFloat(direction.rawValue) * 1000
                let offScreenTransform = self.transform.translatedBy(x: xDirection, y: 0)
                self.transform = offScreenTransform
            }else{
                self.transform = .identity
            }
        }) { _ in
            if shouldDismissCard{
                self.removeFromSuperview()
                return
            }
        }
    }
    func panCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        let ratationalTransform = CGAffineTransform(rotationAngle: angle)
        self.transform = ratationalTransform.translatedBy(x: translation.x, y: translation.y)
    }
}
// MARK: - Action, selector
extension CardView{
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer){
        switch sender.state {
        case .began:
            superview?.subviews.forEach({ $0.layer.removeAllAnimations() })
        case .changed:
            panCard(sender)
        case .ended:
            resetCardPosition(sender)
        default: break
        }
    }
    @objc func handleChangePhoto(_ sender: UITapGestureRecognizer){
        
    }
    
}

