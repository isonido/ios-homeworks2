//
//  PostViewController.swift
//  Navigation
//
//  Created by MacBook on 23.11.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationItem.title = "Мой пост"

        self.view.backgroundColor = .brown
        
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(buttonClick(sender: )))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @IBAction func buttonClick(sender:UIButton){
        let infoView = InfoViewController()

        self.present(infoView, animated: true, completion: nil)
    }
    
}
