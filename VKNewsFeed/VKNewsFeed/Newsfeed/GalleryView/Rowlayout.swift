//
//  Rowlayout.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 26.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

protocol RowLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, photoAtIndexPath indexPath: IndexPath) -> CGSize
}

class Rowlayout: UICollectionViewLayout {
    weak var delegate: RowLayoutDelegate!
    
    fileprivate var numbersOfRows = 1
    fileprivate var cellPadding: CGFloat = 8
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat = 0
    
    // константа
    fileprivate var contentHeight: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
        
        var photos = [CGSize]()
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize = delegate.collectionView(collectionView, photoAtIndexPath: indexPath)
            photos.append(photoSize)
        }
        
        let superViewWidth = collectionView.frame.width
        guard let rowHeight = self.rowHeightCounter(superViewWidth: superViewWidth, photosArray: photos) else { return }
        
    }
    
    private func rowHeightCounter(superViewWidth: CGFloat, photosArray: [CGSize]) -> CGFloat? {
        var rowHeight: CGFloat
        
        let photoWithMinRation = photosArray.min { (first, second) -> Bool in
            (first.height / first.width) < (second.height / second.width)
        }
        
        guard let myPhotoWithMinRation = photoWithMinRation else { return nil }
        
        let difference = superViewWidth / myPhotoWithMinRation.width
        
        rowHeight = myPhotoWithMinRation.height * difference
        
        return rowHeight
    }
}
