//
//  LoginController.swift
//  Tinder-Swift
//
//  Created by hakkı can şengönül on 10.10.2022.
//

import UIKit
class LoginController: UIViewController {
    // MARK: - Properties
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        let image = #imageLiteral(resourceName: "app_icon").withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let passwordTextField = CustomTextField(placeholder: "Password", isSecure: true)
    private lazy var authButton: AuthButton = {
        let button = AuthButton(title: "Log In", type: .system)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    private lazy var stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,authButton])
    private lazy var gotoRegistrationButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16)])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 16)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowRegistration), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension LoginController{
    private func style(){
        configureGradientLayer()
        view.backgroundColor = .systemPink
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        //iconImage style
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconImage)
        //stackView style
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        view.addSubview(stackView)
        //gotoRegistrationButton style
        gotoRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gotoRegistrationButton)
    }
    private func layout(){
        //iconImage layout
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            iconImage.widthAnchor.constraint(equalToConstant: 100),
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
        //stackView layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32)
        ])
        //gotoRegistrationButton layout
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: gotoRegistrationButton.bottomAnchor),
            gotoRegistrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32),
            view.trailingAnchor.constraint(equalTo: gotoRegistrationButton.trailingAnchor, constant: 32)
        ])
    }
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0,1]
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
    }
}
// MARK: - Selectors
extension LoginController{
    @objc func handleLogin(_ sender: AuthButton){
        
    }
    @objc func handleShowRegistration(_ sender: UIButton){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
