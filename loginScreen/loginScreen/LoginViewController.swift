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
    private let preferedSubviewsHeight: CGFloat = 50
    private let sideSubviewsIndents = CGSize(width: 50, height: 25)
    
    // MARK: - UI elements: top stack
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: preferedSubviewsHeight / 2, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
        
    private lazy var loginView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = preferedSubviewsHeight / 2
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
        textField.layer.cornerRadius = preferedSubviewsHeight / 2
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
        button.layer.cornerRadius = preferedSubviewsHeight / 2
        button.backgroundColor = UIColor(red: 0.43, green: 0.42, blue: 0.83, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    // MARK: - UI elements: bottom stack
    
    
    // MARK: - UI elements: stacks
    
    private lazy var topStack: UIStackView = {
        let stackView = UIStackView()
        //stackView.layer.borderColor = UIColor.darkGray.cgColor
        //stackView.layer.borderWidth = 2
        stackView.addSubview(titleLabel)
        stackView.addSubview(loginView)
        stackView.addSubview(passwordView)
        stackView.addSubview(loginButton)
        stackView.addSubview(forgotButton)
        return stackView
    }()
    
    private lazy var bottomStack: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .lightGray
        return stackView
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Setups
    
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
            view.backgroundColor = .systemIndigo
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(topStack)
    }
    
    private func setupLayout() {
        topStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view).multipliedBy(0.8)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).multipliedBy(0.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(preferedSubviewsHeight)
            make.width.equalTo(topStack)
            make.height.equalTo(preferedSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        loginView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(preferedSubviewsHeight)
            make.width.equalTo(topStack)
            make.height.equalTo(preferedSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).offset(preferedSubviewsHeight / 2)
            make.width.equalTo(topStack)
            make.height.equalTo(preferedSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(preferedSubviewsHeight)
            make.width.equalTo(topStack)
            make.height.equalTo(preferedSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom)
            make.width.equalTo(topStack)
            make.height.equalTo(preferedSubviewsHeight)
            make.centerX.equalTo(topStack)
        }
    }
    
    // MARK: - Actions
}

