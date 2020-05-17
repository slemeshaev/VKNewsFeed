//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 13.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map({ (feedItem) in
                print(feedItem.date)
            })
        }

    }

}
