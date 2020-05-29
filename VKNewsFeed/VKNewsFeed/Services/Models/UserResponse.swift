//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 29.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
