//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Andrey Androsov on 01.12.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private var statusText: String = ""
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "dog")
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarTap)))
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.textAlignment = .left
        fullNameLabel.text = "Hipster Dog"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        fullNameLabel.textColor = .black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.textAlignment = .left
        statusTextField.text = "Waiting for something"
        statusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusTextField.textColor = .gray
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private lazy var statusField: UITextField = {
        let statusField = UITextField()
        statusField.backgroundColor = .white
        statusField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusField.textColor = .black
        statusField.placeholder = "Новый статус"
        statusField.layer.cornerRadius = 12
        statusField.layer.borderWidth = 1
        statusField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        statusField.leftViewMode = .always
        statusField.delegate = self
        statusField.translatesAutoresizingMaskIntoConstraints = false
        statusField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.tintColor = .white
        setStatusButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.cornerRadius = 14.0
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return setStatusButton
    }()
    
    private var viewFon: UIView = {
        let viewFon = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewFon.backgroundColor = .white
        viewFon.alpha = 0.0
        return viewFon
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setImage(UIImage(systemName: "xmark.app"), for: .normal)
        cancelButton.tintColor = .black
        cancelButton.alpha = 0.0
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelAnimate), for: .touchUpInside)
        return cancelButton
    }()
    
    private lazy var avatarCenter = avatarImageView.center
    private lazy var avatarBounds = avatarImageView.bounds
    
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .systemGray5
        loadObject()
        setup()
    }

    func loadObject() {
        addSubview(fullNameLabel)
        addSubview(statusTextField)
        addSubview(statusField)
        addSubview(setStatusButton)
        addSubview(viewFon)
        addSubview(avatarImageView)
        addSubview(cancelButton)
    }
    
    @objc func buttonPressed(sender:UIButton){
        if statusField.text?.count == 0 {
            checkEmptyTf()
        } else {
            statusTextField.text = statusText
        }
    }
    
    private func setup() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
            setStatusButton.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 140),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 150),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 21),
            
            statusTextField.bottomAnchor.constraint(equalTo: statusField.topAnchor, constant: -8),
            statusTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 140),
            statusTextField.widthAnchor.constraint(equalToConstant: 150),
            statusTextField.heightAnchor.constraint(equalToConstant: 21),
            
            statusField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -8),
            statusField.heightAnchor.constraint(equalToConstant: 40),
            statusField.leadingAnchor.constraint(equalTo: statusTextField.leadingAnchor),
            statusField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6),
            cancelButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -6)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func avatarTap() {
        avatarCenter = avatarImageView.center
        avatarBounds = avatarImageView.bounds
        
        UIView.animate(withDuration: 0.5, delay: 0) { [self] in
            viewFon.alpha = 0.75
            viewFon.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            avatarImageView.layer.cornerRadius = 0
            avatarImageView.center.x = UIScreen.main.bounds.width/2
            avatarImageView.center.y = UIScreen.main.bounds.height/2 - 44
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0) { [self] in
                cancelButton.alpha = 1
            }
        }
    }
    
    @objc func statusTextChanged() {
        statusText = statusField.text ?? ""
    }

    @objc func cancelAnimate() {
        UIView.animate(withDuration: 0.3, delay: 0) { [self] in
            cancelButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0) { [self] in
                viewFon.alpha = 0.0
                avatarImageView.center = avatarCenter
                avatarImageView.bounds = avatarBounds
                avatarImageView.layer.cornerRadius = 50
            }
        }
    }
    
    private func checkEmptyTf() {
        UIView.animate(withDuration: 0.05, delay: 0) { [self] in
            statusField.backgroundColor = .red
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0) { [self] in
                statusField.backgroundColor = .white
            }
        }
    }
}
