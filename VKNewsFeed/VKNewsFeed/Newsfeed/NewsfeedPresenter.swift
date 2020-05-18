//
//  NewsfeedPresenter.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 17.05.2020.
//  Copyright (c) 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
    func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    weak var viewController: NewsfeedDisplayLogic?
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        switch response {
        case .some:
            print(".some Presenter")
            viewController?.displayData(viewModel: .displayNewsfeed)
        case .presentNewsfeed:
            print(".presentNewsfeed Presenter")
            viewController?.displayData(viewModel: .displayNewsfeed)
        }
        
    }
    
}
