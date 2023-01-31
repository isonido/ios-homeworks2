//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Andrey Androsov on 16.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var indexPath = 0

    var authorCell: UILabel = {
        let authorCell = UILabel()
        authorCell.numberOfLines = 2
        authorCell.font = UIFont.boldSystemFont(ofSize: 20.0)
        authorCell.textColor = .black
        authorCell.translatesAutoresizingMaskIntoConstraints = false
        return authorCell
    }()
    
    lazy var imageCell: UIImageView = {
        let imageCell = UIImageView()
        imageCell.contentMode = .scaleToFill
        imageCell.backgroundColor = .black
        imageCell.isUserInteractionEnabled = true
        imageCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImage)))
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        return imageCell
    }()
    
    var descriptionCell: UILabel = {
        let descriptionCell = UILabel()
        descriptionCell.numberOfLines = 2
        descriptionCell.font = UIFont.systemFont(ofSize: 14)
        descriptionCell.textColor = .systemGray
        descriptionCell.translatesAutoresizingMaskIntoConstraints = false
        return descriptionCell
    }()
    
    lazy var likesCell: UILabel = {
        let likesCell = UILabel()
        likesCell.font = UIFont.systemFont(ofSize: 16)
        likesCell.textColor = .black
        likesCell.isUserInteractionEnabled = true
        likesCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapLike)))
        likesCell.translatesAutoresizingMaskIntoConstraints = false
        return likesCell
    }()
    
    var viewsCell: UILabel = {
        let viewsCell = UILabel()
        viewsCell.font = UIFont.systemFont(ofSize: 16)
        viewsCell.textColor = .black
        viewsCell.translatesAutoresizingMaskIntoConstraints = false
        return viewsCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(authorCell)
        contentView.addSubview(imageCell)
        contentView.addSubview(descriptionCell)
        contentView.addSubview(likesCell)
        contentView.addSubview(viewsCell)
        
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            authorCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            imageCell.topAnchor.constraint(equalTo: authorCell.bottomAnchor, constant: 16),
            imageCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCell.widthAnchor.constraint(equalTo: imageCell.heightAnchor),
            
            descriptionCell.topAnchor.constraint(equalTo: imageCell.bottomAnchor, constant: 16),
            descriptionCell.leadingAnchor.constraint(equalTo: authorCell.leadingAnchor),
            descriptionCell.trailingAnchor.constraint(equalTo: authorCell.trailingAnchor),
            
            likesCell.topAnchor.constraint(equalTo: descriptionCell.bottomAnchor, constant: 16),
            likesCell.leadingAnchor.constraint(equalTo: authorCell.leadingAnchor),
            likesCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            viewsCell.topAnchor.constraint(equalTo: likesCell.topAnchor),
            viewsCell.trailingAnchor.constraint(equalTo: authorCell.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapLike(){
        dataSource[indexPath].likes += 1
        likesCell.text = "Likes: \(dataSource[indexPath].likes)"
    }
    
    @objc func tapImage(){
        dataSource[indexPath].views += 1
        viewsCell.text = "Views: \(dataSource[indexPath].views)"
        
        let postView = PostDetailView()
        postView.indexPath = indexPath
        let navigationController = ((superview as? UITableView)?.dataSource as? UIViewController)?.navigationController
        let navController = UINavigationController(rootViewController: postView)
        navController.modalPresentationStyle = .fullScreen
        navigationController?.present(navController, animated: true)
    }
    
    func config(indexPath: Int) {
        self.indexPath = indexPath
        authorCell.text = dataSource[indexPath].author
        imageCell.image = UIImage(named: dataSource[indexPath].image)
        descriptionCell.text = dataSource[indexPath].description
        likesCell.text = "Likes: \(dataSource[indexPath].likes)"
        viewsCell.text = "Views: \(dataSource[indexPath].views)"
    }
}
