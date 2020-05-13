//
//  AuthService.swift
//  VKNewsFeed
//
//  Created by Станислав Лемешаев on 05.05.2020.
//  Copyright © 2020 Станислав Лемешаев. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

final class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
        
    private let appId = "7439533"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) { [delegate](state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                delegate?.authServiceSignIn()
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("auth problems, state \(state) error \(String(describing: error))")
                delegate?.authServiceDidSignInFail()
            }
        }
    }
    
    // MARK: VKSdkDelegate
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        delegate?.authServiceDidSignInFail()
    }
    
    // MARK: VKSdkUIDelegate
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}
