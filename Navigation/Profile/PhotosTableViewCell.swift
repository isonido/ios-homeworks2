//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by MacBook on 27.12.2022.
//

import UIKit

private var identifier = "Identifier"

class PhotosTableViewCell: UITableViewCell {

    private var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 24.0)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var arrowButton: UIButton = {
        let arrowButton = UIButton()
        arrowButton.setImage(UIImage(systemName: "search"), for: .normal)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
        return arrowButton
    }()
    
    private lazy var previewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        contentView.addSubview(arrowButton)
        contentView.addSubview(previewCollectionView)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            previewCollectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            previewCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            previewCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            previewCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = previewCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.image.image = UIImage(named: photos[indexPath.item])
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeItem = (previewCollectionView.frame.width - 24) / 4
        return CGSize(width: sizeItem, height: sizeItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        let viewController = Photo()
        viewController.name = photos[indexPath.row]

        if let tv = superview as? UITableView {
            if let vc = tv.dataSource as? UIViewController {
                vc.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        */
    }
}
