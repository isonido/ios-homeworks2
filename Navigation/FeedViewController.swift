//
//  FeedViewController.swift
//  Navigation
//
//  Created by MacBook on 23.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let post = Post(title: "Новый пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton(type: .custom) as UIButton
        btn.backgroundColor = .blue
        btn.setTitle("Пост", for: .normal)
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnClick(sender:UIButton){
        let postView = PostViewController()
        postView.navigationItem.title = post.title
        self.navigationController?.pushViewController(postView, animated: true)
    }
    
}
