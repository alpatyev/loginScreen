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
    private let preferedSubviewsHeight: CGFloat = 60
    private let sideSubviewsIndents = CGSize(width: 60, height: 30)
    
    // MARK: - Lifecycle
        
    private lazy var loginView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = 30
        textField.placeholder = "Login"
        
        textField.leftView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                   scale: 0.7,
                                                   imageNamed: "person.png")
        textField.leftViewMode = .always
        textField.rightView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                    scale: 0.7,
                                                    imageNamed: "check.png")
        textField.rightViewMode = .whileEditing
        
        return textField
    }()
    
    private lazy var paswordView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.cornerRadius = 30
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        
        textField.leftView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                   scale: 0.7,
                                                   imageNamed: "lock.png")
        textField.leftViewMode = .always
        textField.rightView = viewWithAttachedImage(withSize: sideSubviewsIndents,
                                                    scale: 1,
                                                    imageNamed: "unknown")
        textField.rightViewMode = .always
        
        return textField

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
        view.addSubview(loginView)
        view.addSubview(paswordView)
    }
    
    private func setupLayout() {
        loginView.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.8)
            make.height.equalTo(preferedSubviewsHeight)
        }
        
        paswordView.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp_bottomMargin)
            make.centerX.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.8)
            make.height.equalTo(preferedSubviewsHeight)
        }
    }
    
    // MARK: - Actions
}

