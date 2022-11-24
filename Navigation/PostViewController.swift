//
//  PostViewController.swift
//  Navigation
//
//  Created by MacBook on 23.11.2022.
//

import UIKit

class PostViewController: UIViewController, NewDataProtocol {
    
    func setNewData(data: Post) {
        self.navigationItem.title = data.title
        print(data.title)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let vc = FeedViewController()
        //vc.delegate = self
        //self.navigationItem.title = newTitle
        self.navigationItem.title = "Мой пост"
        self.view.backgroundColor = .brown
        
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(buttonClick(sender: )))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @IBAction func buttonClick(sender:UIButton){
        let infoView = InfoViewController()

        self.present(infoView, animated: true, completion: nil)
    }
    
}
