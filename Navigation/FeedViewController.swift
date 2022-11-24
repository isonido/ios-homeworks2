//
//  FeedViewController.swift
//  Navigation
//
//  Created by MacBook on 23.11.2022.
//

import UIKit

struct Post {
    let title: String
}



class FeedViewController: UIViewController {

    let post = Post(title: "Новый пост")
    
    var delegate: NewDataProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton(type: .custom) as UIButton
        btn.backgroundColor = .blue
        btn.setTitle("Пост", for: .normal)
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        btn.addTarget(self, action: #selector(btnClick(sender: )), for: .touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    @IBAction func btnClick(sender:UIButton){
        let postView = PostViewController()
        delegate?.setNewData(data: post)
        self.navigationController?.pushViewController(postView, animated: true)
    }
    
}

protocol NewDataProtocol{
    func setNewData(data: Post)
}
