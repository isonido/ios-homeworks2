//
//  InfoViewController.swift
//  Navigation
//
//  Created by MacBook on 24.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue
        
        let btn = UIButton(type: .custom) as UIButton
        btn.backgroundColor = .red
        btn.setTitle("Пост", for: .normal)
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnClick(sender:UIButton){
        let alert = UIAlertController(title: "Ошибка", message: "Сообщение", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: { (action: UIAlertAction!) in
          print("Нажали Отмена")
          }))

        alert.addAction(UIAlertAction(title: "Хорошо", style: .cancel, handler: { (action: UIAlertAction!) in
          print("Нажали Хорошо")
          }))

        self.present(alert, animated: true, completion: nil)
    }
}
