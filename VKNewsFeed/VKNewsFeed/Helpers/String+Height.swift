//
//  String+Height.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 20.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = self.boundingRect(with: textSize,
                                      options: .usesLineFragmentOrigin,
                                      attributes: [NSAttributedString.Key.font : font],
                                      context: nil)
        return ceil(size.height)
    }
}
