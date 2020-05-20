//
//  NewsfeedCodeCell.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 20.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

final class NewsfeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsfeedCodeCell"
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cardView)
        
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        // cardView constraints
//        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
//        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
//        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
//        cardView.fillSuperview(padding: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        
//        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        cardView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        cardView.anchor(top: topAnchor,
                        leading: leadingAnchor,
                        bottom: nil,
                        trailing: nil,
                        padding: UIEdgeInsets(top: 8, left: 8, bottom: 777, right: 777),
                        size: CGSize(width: 40, height: 40))
        
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
//        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        cardView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
//        cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        cardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
