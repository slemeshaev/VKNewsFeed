//
//  NewsfeedCellLayoutCalculator.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 20.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomView: CGRect
    var totalHeight: CGFloat
}

struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 36
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8,
                                              left: 8,
                                              bottom: 8,
                                              right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
}

final class NewsfeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        
        let cardViewWidth = screenWidth - Constants.cardInsets.left - Constants.cardInsets.right
        
        // MARK: - Работа с postLabelFrame
        
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left,
                                                    y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        // MARK: - Работа с attachmentFrame
        
        
        return Sizes(postLabelFrame: postLabelFrame,
                     attachmentFrame: CGRect.zero,
                     bottomView: CGRect.zero,
                     totalHeight: 300)
    }
    
}
