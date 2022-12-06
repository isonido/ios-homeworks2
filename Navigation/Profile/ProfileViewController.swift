//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 23.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        setup()
    }

    private func setup() {
        self.view.backgroundColor = .lightGray
        title = "Профиль"
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
