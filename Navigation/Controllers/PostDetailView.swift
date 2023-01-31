//
//  PostDetailView.swift
//  Navigation
//
//  Created by Andrey Androsov on 31.01.2023.
//

import UIKit

class PostDetailView: UIViewController {

    var indexPath = 0
    
    var imageDetail: UIImageView = {
        let imageDetail = UIImageView()
        imageDetail.contentMode = .scaleToFill
        imageDetail.backgroundColor = .black
        imageDetail.isUserInteractionEnabled = true
        imageDetail.translatesAutoresizingMaskIntoConstraints = false
        return imageDetail
    }()
    
    var descriptionDetail: UITextView = {
        let descriptionDetail = UITextView()
        descriptionDetail.isScrollEnabled = false
        descriptionDetail.sizeToFit()
        //descriptionDetail.textContainer.lineFragmentPadding = 0
        descriptionDetail.font = UIFont.systemFont(ofSize: 17)
        descriptionDetail.textColor = .black
        descriptionDetail.translatesAutoresizingMaskIntoConstraints = false
        return descriptionDetail
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageDetail)
        view.addSubview(descriptionDetail)
        setupLayout()
        loadData()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        let rightButton = UIBarButtonItem(title: "Назад", style: .done, target: self, action: #selector(rightButtonClick))
        navigationItem.rightBarButtonItem = rightButton
        navigationController?.navigationBar.prefersLargeTitles = false
        
        NSLayoutConstraint.activate([
            imageDetail.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageDetail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageDetail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageDetail.widthAnchor.constraint(equalTo: imageDetail.heightAnchor),
            
            descriptionDetail.topAnchor.constraint(equalTo: imageDetail.bottomAnchor, constant: 10),
            descriptionDetail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            descriptionDetail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func loadData() {
        navigationItem.title = dataSource[indexPath].author
        imageDetail.image = UIImage(named: dataSource[indexPath].image)
        descriptionDetail.text = dataSource[indexPath].description
    }
    
    @objc func rightButtonClick(sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
