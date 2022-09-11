//
//  CardView.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 4.09.2022.
//

import UIKit
class CardView: UIView {
    // MARK: - Properties
    private let gradient = CAGradientLayer()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        let image = #imageLiteral(resourceName: "jane1")
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
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
    override init(frame: CGRect) {
        super.init(frame: frame)
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
}
// MARK: - Action, selector
extension CardView{
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: nil)
        switch sender.state {
        case .began:
            print("a")
        case .changed:
            let degrees: CGFloat = translation.x / 20
            let angle = degrees * .pi / 180
            let ratationalTransform = CGAffineTransform(rotationAngle: angle)
            self.transform = ratationalTransform.translatedBy(x: translation.x, y: translation.y)
        case .ended:
            print("c")
        default: break
        }
    }
    @objc func handleChangePhoto(_ sender: UITapGestureRecognizer){
        
    }
}

