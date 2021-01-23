//
//  SceneDelegate.swift
//  Shop
//
//  Created by Максим Вечирко on 18.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var builder: AbstractBuilder?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        builder = LoginBuilder()
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        window?.rootViewController = builder?.createModule() as! UINavigationController
        window?.makeKeyAndVisible()
    }

}

