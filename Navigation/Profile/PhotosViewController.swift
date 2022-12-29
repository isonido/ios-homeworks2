//
//  PhotosViewController.swift
//  Navigation
//
//  Created by MacBook on 28.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private var identifier = "Identifier"
    
    private lazy var photoGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let photoGallery = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoGallery.dataSource = self
        photoGallery.delegate = self
        photoGallery.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        photoGallery.translatesAutoresizingMaskIntoConstraints = false
        return photoGallery
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(photoGallery)
        self.view.backgroundColor = .white
        self.navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            photoGallery.topAnchor.constraint(equalTo: view.topAnchor, constant: 4),
            photoGallery.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            photoGallery.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            photoGallery.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoGallery.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.image.image = UIImage(named: photos[indexPath.item])
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeItem = (photoGallery.frame.width - 32) / 3
        return CGSize(width: sizeItem, height: sizeItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
}
