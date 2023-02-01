//
//  PostViewController.swift
//  Navigation
//
//  Created by Andrey Androsov on 23.11.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .brown
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(buttonClick))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc func buttonClick(sender:UIButton){
        let infoView = InfoViewController()

        self.present(infoView, animated: true, completion: nil)
    }
    
}
