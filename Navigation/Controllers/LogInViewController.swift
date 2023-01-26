//
//  LogInViewController.swift
//  Navigation
//
//  Created by Andrey Androsov on 08.12.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var textFieldContainer: UIView = {
        let textFieldContainer = UIView()
        textFieldContainer.backgroundColor = .lightGray
        textFieldContainer.layer.masksToBounds = true
        textFieldContainer.layer.cornerRadius = 10
        textFieldContainer.layer.borderWidth = 0.5
        textFieldContainer.layer.borderColor = UIColor.lightGray.cgColor
        textFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        return textFieldContainer
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        let imageColor = UIImage(named: "blue_pixel")
        let imageColorAlpha = UIImage(named: "blue_pixel")!.alpha(0.8)

        logInButton.setBackgroundImage(imageColor, for: .normal)
        logInButton.setImage(imageColorAlpha, for: [.selected, .highlighted, .disabled])
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.layer.masksToBounds = true
        logInButton.tintColor = .white
        logInButton.layer.cornerRadius = 10
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(logInBtn), for: .touchUpInside)
        return logInButton
    }()
    
    private var logoVk: UIImageView = {
        let logoVk = UIImageView()
        logoVk.image = UIImage(named: "logo")
        logoVk.translatesAutoresizingMaskIntoConstraints = false
        return logoVk
    }()
    
    private var hiddenLabel: UILabel = {
        let hiddenLabel = UILabel()
        hiddenLabel.text = "Количество символов меньше 6"
        hiddenLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        hiddenLabel.textColor = .systemRed
        hiddenLabel.isHidden = true
        hiddenLabel.translatesAutoresizingMaskIntoConstraints = false
        return hiddenLabel
    }()
    
    private lazy var loginTf: UITextField = {
        let loginTf = UITextField()
        loginTf.backgroundColor = .systemGray6
        loginTf.textAlignment = .left
        loginTf.placeholder = "Email of phone"
        loginTf.setLeftPaddingPoints(10)
        loginTf.font = UIFont.systemFont(ofSize: 16)
        loginTf.textColor = .black
        loginTf.tintColor = UIColor(named: "AccentColor")
        loginTf.autocapitalizationType = .none
        loginTf.translatesAutoresizingMaskIntoConstraints = false
        loginTf.addTarget(self, action: #selector(loginTfChanged), for: .editingChanged)
        return loginTf
    }()
    
    private lazy var passwordTf: UITextField = {
        let passwordTf = UITextField()
        passwordTf.backgroundColor = .systemGray6
        passwordTf.isSecureTextEntry = true
        passwordTf.textAlignment = .left
        passwordTf.placeholder = "Password"
        passwordTf.setLeftPaddingPoints(10)
        passwordTf.font = UIFont.systemFont(ofSize: 16)
        passwordTf.textColor = .black
        passwordTf.tintColor = UIColor(named: "AccentColor")
        passwordTf.autocapitalizationType = .none
        passwordTf.translatesAutoresizingMaskIntoConstraints = false
        passwordTf.addTarget(self, action: #selector(passwordTfChanged), for: .editingChanged)
        return passwordTf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoVk)
        contentView.addSubview(textFieldContainer)
        textFieldContainer.addSubview(loginTf)
        textFieldContainer.addSubview(passwordTf)
        contentView.addSubview(hiddenLabel)
        contentView.addSubview(logInButton)
        
        scrollView.keyboardDismissMode = .interactive
    }

    func validBy(email: String) -> Bool {
        let eMailPattern = #""" """#
        let result = email.range(of: eMailPattern, options: .regularExpression)
        let validEmail = (result != nil)
        return validEmail
    }
    
    @objc func logInBtn(sender:UIButton){
        if loginTf.text?.count == 0 {
            if passwordTf.text?.count == 0 {
                UIView.animate(withDuration: 0.05, delay: 0) { [self] in
                    passwordTf.backgroundColor = .red
                } completion: { _ in
                    UIView.animate(withDuration: 0.5, delay: 0) { [self] in
                        passwordTf.backgroundColor = .systemGray6
                    }
                }
            }
            UIView.animate(withDuration: 0.05, delay: 0) { [self] in
                loginTf.backgroundColor = .red
            } completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0) { [self] in
                    loginTf.backgroundColor = .systemGray6
                }
            }
        } else if passwordTf.text?.count == 0 {
            UIView.animate(withDuration: 0.05, delay: 0) { [self] in
                passwordTf.backgroundColor = .red
            } completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0) { [self] in
                    passwordTf.backgroundColor = .systemGray6
                }
            }
        } else {
            let profileViewController = ProfileViewController()
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
    
    @objc func loginTfChanged(_ textField: UITextField) {
        
    }
    
    @objc func passwordTfChanged(_ textField: UITextField) {
        let textCount = textField.text?.count
        if let tc = textCount {
            if tc < 6 {
                if tc == 0 {
                    hiddenLabel.isHidden = true
                } else {
                    hiddenLabel.isHidden = false
                }
            } else {
                hiddenLabel.isHidden = true
            }
        }
    }
    
    func subscribeKeyboardEvents(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification){
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 16, right: 0)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification){
        self.scrollView.contentInset = .zero
    }

    private func setupLayout() {
        self.navigationController?.navigationBar.isHidden = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoVk.heightAnchor.constraint(equalToConstant: 100),
            logoVk.widthAnchor.constraint(equalToConstant: 100),
            logoVk.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoVk.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            
            textFieldContainer.topAnchor.constraint(equalTo: logoVk.bottomAnchor, constant: 120),
            textFieldContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textFieldContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textFieldContainer.heightAnchor.constraint(equalToConstant: 100),
            
            loginTf.topAnchor.constraint(equalTo: textFieldContainer.topAnchor),
            loginTf.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor),
            loginTf.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor),
            loginTf.heightAnchor.constraint(equalToConstant: 49.75),
            
            passwordTf.bottomAnchor.constraint(equalTo: textFieldContainer.bottomAnchor),
            passwordTf.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor),
            passwordTf.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor),
            passwordTf.heightAnchor.constraint(equalToConstant: 49.75),
            
            hiddenLabel.topAnchor.constraint(equalTo: textFieldContainer.bottomAnchor, constant: 8),
            hiddenLabel.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor),
            
            logInButton.topAnchor.constraint(equalTo: hiddenLabel.bottomAnchor, constant: 8),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension String {
    func isValidEmail() -> Bool {
        return true
    }
}
