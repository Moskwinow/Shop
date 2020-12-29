//
//  AppDelegate.swift
//  Shop
//
//  Created by Максим Вечирко on 18.12.2020.
//  Copyright © 2020 Максим Вечирко. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //       MARK: - Вход
        
//        let auth = requestFactory.makeAuthRequestFactory()
//        auth.login(userName: "Moskwinow", password: "123456") { (result) in
//            switch result.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        //       MARK: - Выход
        
//        let logout = requestFactory.makeLogOutRequestFactory()
//        logout.logout { (result) in
//            switch result.result {
//            case .success(let loggedout):
//                print(loggedout)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        //       MARK: - Обновление профиля
        
//        let update = requestFactory.makeUpdatingFactory()
//        update.updateUser { (result) in
//            switch result.result {
//            case .success(let updated):
//                print(updated)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        //       MARK: - Регистрация
        let register = requestFactory.makeRegisterUserFactory()
        register.register { (result) in
            switch result.result {
            case .success(let registred):
                print(registred)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

