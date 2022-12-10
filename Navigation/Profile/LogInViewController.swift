//
//  LogInViewController.swift
//  Navigation
//
//  Created by MacBook on 08.12.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        //scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var textFieldContainer: UIView = {
        let textFieldContainer = UIView()
        textFieldContainer.backgroundColor = .lightGray
        textFieldContainer.layer.cornerRadius = 10
        textFieldContainer.layer.borderWidth = 0.5
        textFieldContainer.layer.borderColor = UIColor.lightGray.cgColor
        textFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        return textFieldContainer
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        let imageColor = UIImage(named: "blue_pixel")
        logInButton.setBackgroundImage(imageColor, for: .normal)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.layer.masksToBounds = true
        logInButton.tintColor = .white
        logInButton.layer.cornerRadius = 10
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return logInButton
    }()
    
    private var logoVk: UIImageView = {
        let logoVk = UIImageView()
        logoVk.image = UIImage(named: "logo")
        logoVk.translatesAutoresizingMaskIntoConstraints = false
        return logoVk
    }()
    
    private var loginTf: UITextField = {
        let loginTf = UITextField()
        loginTf.backgroundColor = .systemGray6
        loginTf.textAlignment = .left
        loginTf.placeholder = "  Email of phone"
        loginTf.font = UIFont.systemFont(ofSize: 16)
        loginTf.textColor = .black
        loginTf.tintColor = UIColor(named: "AccentColor")
        loginTf.autocapitalizationType = .none
        loginTf.translatesAutoresizingMaskIntoConstraints = false
        return loginTf
    }()
    
    private var passwordTf: UITextField = {
        let passwordTf = UITextField()
        passwordTf.backgroundColor = .systemGray6
        passwordTf.isSecureTextEntry = true
        passwordTf.textAlignment = .left
        passwordTf.placeholder = "  Password"
        passwordTf.font = UIFont.systemFont(ofSize: 16)
        passwordTf.textColor = .black
        passwordTf.tintColor = UIColor(named: "AccentColor")
        passwordTf.autocapitalizationType = .none
        passwordTf.translatesAutoresizingMaskIntoConstraints = false
        return passwordTf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(logoVk)
        scrollView.addSubview(textFieldContainer)
        textFieldContainer.addSubview(loginTf)
        textFieldContainer.addSubview(passwordTf)
        scrollView.addSubview(logInButton)
    }
    
    @objc func buttonPressed(sender:UIButton){
        print("")
    }

    private func setupLayout() {
        self.navigationController?.navigationBar.isHidden = true
        
        NSLayoutConstraint.activate([
            logoVk.heightAnchor.constraint(equalToConstant: 100),
            logoVk.widthAnchor.constraint(equalToConstant: 100),
            logoVk.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoVk.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            
            textFieldContainer.topAnchor.constraint(equalTo: logoVk.bottomAnchor, constant: 120),
            textFieldContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            textFieldContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textFieldContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            textFieldContainer.heightAnchor.constraint(equalToConstant: 100),
            
            loginTf.topAnchor.constraint(equalTo: textFieldContainer.topAnchor),
            loginTf.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor),
            loginTf.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor),
            loginTf.heightAnchor.constraint(equalToConstant: 49.75),
            
            passwordTf.bottomAnchor.constraint(equalTo: textFieldContainer.bottomAnchor),
            passwordTf.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor),
            passwordTf.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor),
            passwordTf.heightAnchor.constraint(equalToConstant: 49.75),
            
            logInButton.topAnchor.constraint(equalTo: textFieldContainer.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
