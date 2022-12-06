//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook on 01.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var name: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.text = "Hipster Dog"
        name.font = UIFont.boldSystemFont(ofSize: 18.0)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private var status: UITextField = {
        let status = UITextField()
        status.textAlignment = .left
        status.text = "Waiting for something"
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.setTitle("Show status", for: .normal)
        btn.tintColor = .white
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        btn.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        btn.layer.shadowOpacity = 0.7
        btn.layer.shadowRadius = 4.0
        btn.layer.cornerRadius = 4.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return btn
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        
        loadObject()
        setup()
    }

    func loadObject() {
        self.addSubview(imageView)
        self.addSubview(name)
        self.addSubview(status)
        self.addSubview(btn)
    }
    
    @objc func buttonPressed(sender:UIButton){
        print(status.text ?? "")
    }
    
    private func setup() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            btn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            btn.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            btn.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            btn.heightAnchor.constraint(equalToConstant: 50),
            name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            name.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 140),
            name.widthAnchor.constraint(equalToConstant: 150),
            name.heightAnchor.constraint(equalToConstant: 21),
            status.bottomAnchor.constraint(equalTo: btn.topAnchor, constant: -34),
            status.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 140),
            status.widthAnchor.constraint(equalToConstant: 150),
            status.heightAnchor.constraint(equalToConstant: 21)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
