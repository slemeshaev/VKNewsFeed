//
//  GalleryCollectionView.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 26.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var photos = [FeedCellPhotoAttachmentViewModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseID)
    }
    
    func set(photos: [FeedCellPhotoAttachmentViewModel]) {
        self.photos = photos
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GalleryCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseID, for: indexPath) as! GalleryCollectionViewCell
        cell.set(imageUrl: photos[indexPath.row].photoUrlString)
        return cell
    }
}
