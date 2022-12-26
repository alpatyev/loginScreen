//
//  LoginViewController.swift
//  loginScreen
//
//  Created by Nikita Alpatiev on 12/21/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: - Helpers
    private let preferredSubviewsHeight: CGFloat = 50
    private lazy var sideSubviewsIndents = {
        CGSize(width: preferredSubviewsHeight, height: preferredSubviewsHeight / 2)
    }()
    
    // MARK: - UI elements: top stack
    
    private lazy var topStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addSubview(titleLabel)
        stackView.addSubview(loginView)
        stackView.addSubview(passwordView)
        stackView.addSubview(loginButton)
        stackView.addSubview(forgotButton)
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: preferredSubviewsHeight / 2, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
        
    private lazy var loginView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = preferredSubviewsHeight / 2
        textField.createShadowLayer(withCornerradius: preferredSubviewsHeight / 2)
        textField.placeholder = "Name"
        
        textField.leftView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                   scale: 0.7,
                                                   imageNamed: "person.png")
        textField.rightView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                    scale: 0.7,
                                                    imageNamed: "check.png")
        textField.leftViewMode = .always
        textField.rightViewMode = .whileEditing
        
        return textField
    }()
    
    private lazy var passwordView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = preferredSubviewsHeight / 2
        textField.createShadowLayer(withCornerradius: preferredSubviewsHeight / 2)
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        
        textField.leftView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                   scale: 0.7,
                                                   imageNamed: "lock.png")
        textField.rightView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                    scale: 1,
                                                    imageNamed: "unknown")

        textField.leftViewMode = .always
        textField.rightViewMode = .always
        
        return textField

    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = preferredSubviewsHeight / 2
        button.backgroundColor = UIColor(red: 0.44, green: 0.41, blue: 0.82, alpha: 1.00)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.createShadowLayer(withCornerradius: preferredSubviewsHeight / 2)
        button.addTarget(self, action: #selector(anyAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(anyAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - UI elements: bottom stacks
    
    private lazy var bottomStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addSubview(signUpButton)
        stackView.addSubview(connectWithFacebookButton)
        stackView.addSubview(connectWithTwitterButton)
        stackView.addSubview(separatorView)
        return stackView
    }()
    
    private lazy var signUpButton: UIView = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Don`t have an account?" + "     "
        label.textColor = .darkGray
      
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(anyAction), for: .touchUpInside)
        
        let signUpSpace = UIView()
        signUpSpace.addSubview(label)
        signUpSpace.addSubview(button)
        return signUpSpace
    }()
    
    private lazy var connectWithFacebookButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = preferredSubviewsHeight / 2
        button.createShadowLayer(withCornerradius: preferredSubviewsHeight / 2)
        button.backgroundColor = UIColor(red: 0.06, green: 0.63, blue: 0.95, alpha: 1.00)

        let image = viewWithAttachedImage(withSize: CGSize(width: preferredSubviewsHeight * 1.4,
                                                           height: preferredSubviewsHeight),
                                          scale: 0.32,
                                          imageNamed: "facebook.png")
        
        let title = UILabel()
        title.text = "Facebook"
        title.textColor = .white
        
        button.addSubview(image)
        button.addSubview(title)
        button.addTarget(self, action: #selector(anyAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var connectWithTwitterButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = preferredSubviewsHeight / 2
        button.createShadowLayer(withCornerradius: preferredSubviewsHeight / 2)
        button.backgroundColor = UIColor(red: 0.33, green: 0.42, blue: 0.71, alpha: 1.00)

        let image = viewWithAttachedImage(withSize: CGSize(width: preferredSubviewsHeight * 1.4,
                                                           height: preferredSubviewsHeight),
                                          scale: 0.32,
                                          imageNamed: "twitter.png")
        
        let title = UILabel()
        title.text = "Twitter"
        title.textColor = .white
        
        button.addSubview(image)
        button.addSubview(title)
        button.addTarget(self, action: #selector(anyAction), for: .touchUpInside)

        return button
    }()
    
    private lazy var separatorView: UIView = {
        let attached = UIView()
        
        let leftSeparator = UIView()
        let rigtSeparator = UIView()
        leftSeparator.backgroundColor = .lightGray
        rigtSeparator.backgroundColor = .lightGray
        
        let centerLabel = UILabel()
        centerLabel.text = "or connect with"
        centerLabel.textAlignment = .center
        centerLabel.textColor = .lightGray
        
        attached.addSubview(leftSeparator)
        attached.addSubview(centerLabel)
        attached.addSubview(rigtSeparator)
        
        return attached
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupTopStackLayout()
        setupBottomStackLayout()
    }
    
    // MARK: - Setup view
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupView() {
        if let background = UIImage(named: "background.jpg") {
            let imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
        } else {
            view.backgroundColor = UIColor(red: 0.44, green: 0.41, blue: 0.82, alpha: 1.00)
        }
    }
    
    // MARK: - Setup hierarchy
    
    private func setupHierarchy() {
        view.addSubview(topStack)
        view.addSubview(bottomStack)
    }
    
    // MARK: - Setup top stack layout
    
    private func setupTopStackLayout() {
        topStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view).multipliedBy(0.8)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.centerY)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(preferredSubviewsHeight)
            make.width.equalTo(topStack)
            make.height.equalTo(preferredSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        loginView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(preferredSubviewsHeight)
            make.width.equalTo(topStack)
            make.height.equalTo(preferredSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).offset(preferredSubviewsHeight / 2)
            make.width.equalTo(topStack)
            make.height.equalTo(preferredSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(preferredSubviewsHeight)
            make.width.equalTo(topStack)
            make.height.equalTo(preferredSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom)
            make.width.equalTo(topStack)
            make.height.equalTo(preferredSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
    }
    
    // MARK: - Setup bottom stack layout: stack
    
    func setupBottomStackLayout() {
        bottomStack.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.8)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.centerY)
        }
        
        // MARK: - Setup bottom stack layout: sign up button

        // button view
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomStack)
            make.left.equalTo(signUpButton.subviews[0].snp.left)
            make.right.equalTo(signUpButton.subviews[1].snp.right)
            make.height.equalTo(preferredSubviewsHeight * 2)
            make.centerX.equalTo(bottomStack)
        }
        
        // label
        
        signUpButton.subviews[0].snp.makeConstraints { make in
            make.centerY.equalTo(signUpButton)
            make.left.equalTo(signUpButton)
            make.right.equalTo(signUpButton.subviews[1].snp.left)
        }
        
        // actual point of button
        
        signUpButton.subviews[1].snp.makeConstraints { make in
            make.centerY.equalTo(signUpButton)
            make.left.equalTo(signUpButton.subviews[0].snp.right)
            make.right.lessThanOrEqualTo(signUpButton)
        }
        
        // MARK: - Setup bottom stack layout: connect with Facebook/Twitter buttons

        // Using Facebook
        
        connectWithFacebookButton.snp.makeConstraints { make in
            make.bottom.equalTo(signUpButton.snp.top)
            make.left.equalTo(bottomStack.snp.left)
            make.right.equalTo(bottomStack.snp.centerX).inset(preferredSubviewsHeight / 4)
            make.height.equalTo(preferredSubviewsHeight)
        }
        
        connectWithFacebookButton.subviews[1].snp.makeConstraints { make in
            make.centerY.equalTo(connectWithFacebookButton)
            make.left.equalTo(connectWithFacebookButton.subviews[0].snp.right).inset(preferredSubviewsHeight / 4)
        }
        
        // Using Twitter
        
        connectWithTwitterButton.snp.makeConstraints { make in
            make.bottom.equalTo(signUpButton.snp.top)
            make.left.equalTo(bottomStack.snp.centerX).offset(preferredSubviewsHeight / 4)
            make.right.equalTo(bottomStack.snp.right)
            make.height.equalTo(preferredSubviewsHeight)
        }
        
        connectWithTwitterButton.subviews[1].snp.makeConstraints { make in
            make.centerY.equalTo(connectWithTwitterButton)
            make.left.equalTo(connectWithTwitterButton.subviews[0].snp.right).inset(preferredSubviewsHeight / 4)
        }
        
        // MARK: - Setup bottom stack layout: separator

        // this view
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalTo(connectWithFacebookButton.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(bottomStack)
            make.height.equalTo(preferredSubviewsHeight)
            make.centerX.equalTo(bottomStack)
        }
        
        // left line
    
        separatorView.subviews[0].snp.makeConstraints { make in
            make.centerY.equalTo(separatorView)
            make.height.equalTo(1.2)
            make.left.equalTo(separatorView.snp.left)
            make.right.equalTo(separatorView.subviews[1].snp.left)
        }
        
        // centered label
        
        separatorView.subviews[1].snp.makeConstraints { make in
            make.centerX.equalTo(separatorView)
            make.centerY.equalTo(separatorView)
            make.height.equalTo(separatorView)
            make.width.equalTo(separatorView).multipliedBy(0.4)
            make.left.equalTo(separatorView.subviews[0].snp.right)
            make.right.equalTo(separatorView.subviews[2].snp.left)
        }
        
        // right line
        
        separatorView.subviews[2].snp.makeConstraints { make in
            make.centerY.equalTo(separatorView)
            make.height.equalTo(1.2)
            make.right.equalTo(separatorView.snp.right)
            make.left.equalTo(separatorView.subviews[1].snp.right)
        }
    }
    
    // MARK: - Actions
    
    @objc func anyAction() {
        print("some actions..")
    }
}

