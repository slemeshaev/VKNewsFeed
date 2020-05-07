//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 05.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = AppDelegate.shared().authService
    }
    
    @IBAction func signInTouch(_ sender: UIButton) {
        print(#function)
        authService.wakeUpSession()
    }
    

}
