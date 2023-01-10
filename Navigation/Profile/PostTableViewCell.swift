//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Andrey Androsov on 16.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var authorCell: UILabel = {
        let authorCell = UILabel()
        authorCell.numberOfLines = 2
        authorCell.font = UIFont.boldSystemFont(ofSize: 20.0)
        authorCell.textColor = .black
        authorCell.translatesAutoresizingMaskIntoConstraints = false
        return authorCell
    }()
    
    var imageCell: UIImageView = {
        let imageCell = UIImageView()
        imageCell.contentMode = .scaleToFill
        imageCell.backgroundColor = .black
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        return imageCell
    }()
    
    var descriptionCell: UILabel = {
        let descriptionCell = UILabel()
        descriptionCell.numberOfLines = 0
        descriptionCell.font = UIFont.systemFont(ofSize: 14)
        descriptionCell.textColor = .systemGray
        descriptionCell.translatesAutoresizingMaskIntoConstraints = false
        return descriptionCell
    }()
    
    var likesCell: UILabel = {
        let likesCell = UILabel()
        likesCell.font = UIFont.systemFont(ofSize: 16)
        likesCell.textColor = .black
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
}
