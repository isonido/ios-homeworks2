//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Andrey Androsov on 28.12.2022.
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
    
    private var viewFon: UIView = {
        let viewFon = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        viewFon.backgroundColor = .white
        viewFon.alpha = 0.0
        return viewFon
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.0
        return imageView
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setImage(UIImage(systemName: "xmark.app"), for: .normal)
        cancelButton.tintColor = .black
        cancelButton.alpha = 0.0
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelBtn), for: .touchUpInside)
        return cancelButton
    }()
    
    var selectedCell = UICollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(photoGallery)
        view.addSubview(viewFon)
        view.addSubview(imageView)
        view.addSubview(cancelButton)
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
            photoGallery.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4),
            
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -6)
        ])
    }
    
    @objc func cancelBtn() {
        UIView.animate(withDuration: 0.3, delay: 0) { [self] in
            cancelButton.alpha = 0
            imageView.alpha = 0
            viewFon.alpha = 0.0
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = collectionView.cellForItem(at: indexPath)!
        let selectedCellImage = selectedCell as! PhotosCollectionViewCell
        
        imageView.image = UIImage(named: photos[indexPath.row])
        imageView.alpha = 1.0
        imageView.frame = CGRect(x: selectedCellImage.frame.origin.x + 4, y: selectedCellImage.frame.origin.y - photoGallery.contentOffset.y + 4, width: selectedCellImage.frame.width, height: selectedCellImage.frame.height)
        
        UIView.animate(withDuration: 0.4, delay: 0) { [self] in
            viewFon.alpha = 0.75
            viewFon.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            imageView.center.x = UIScreen.main.bounds.width/2
            imageView.center.y = UIScreen.main.bounds.height/2 - 44
        } completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0) { [self] in
                cancelButton.alpha = 1
            }
        }
    }
}
