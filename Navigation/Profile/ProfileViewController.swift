//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 23.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    
    private lazy var changeTitleBtn: UIButton = {
        let changeTitleBtn = UIButton()
        changeTitleBtn.backgroundColor = .systemBlue
        changeTitleBtn.setTitle("Change title", for: .normal)
        changeTitleBtn.tintColor = .white
        changeTitleBtn.translatesAutoresizingMaskIntoConstraints = false
        changeTitleBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return changeTitleBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        self.view.addSubview(changeTitleBtn)
        setup()
    }
    
    @objc func buttonPressed(sender:UIButton){
        title = "Изменили тайтл"
    }
    
    private func setup() {
        self.view.backgroundColor = .lightGray
        title = "Профиль"
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            changeTitleBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            changeTitleBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            changeTitleBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            changeTitleBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
