//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook on 01.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    init() {
        super.init(frame: CGRect.zero)
        
        loadObject()
    }

    func loadObject() {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "dog")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        let name = UILabel(frame: .zero)
        name.textAlignment = .left
        name.text = "Hipster Dog"
        name.font = UIFont.boldSystemFont(ofSize: 18.0)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
        
        let status = UILabel(frame: .zero)
        status.textAlignment = .left
        status.text = "Waiting for something"
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(status)
        
        let btn = UIButton(frame: .zero)
        btn.backgroundColor = .systemBlue
        btn.setTitle("Show status", for: .normal)
        btn.tintColor = .white
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        btn.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        btn.layer.shadowOpacity = 0.7
        btn.layer.shadowRadius = 4.0
        btn.layer.cornerRadius = 4.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        //btn.addTarget(self, action: "changeLabel", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            btn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            btn.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            //btn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
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
