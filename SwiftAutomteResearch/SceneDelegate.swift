//
//  SceneDelegate.swift
//  SwiftAutomteResearch
//
//  Created by Masanao Imai on 2020/02/06.
//  Copyright © 2020 Masanao Imai. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        let window = UIWindow(windowScene: scene)
        self.window = window
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: SearchUserRouter.assembleModules())
    }

}
