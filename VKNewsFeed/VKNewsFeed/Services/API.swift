//
//  API.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 14.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.103"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
