//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook on 23.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    //var profileHeaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        title = "Профиль"
        
        let profileHeaderView = ProfileHeaderView()
        self.view.addSubview(profileHeaderView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        
        //profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        
        //profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
}
