//
//  SceneDelegate.swift
//  MusicApp
//
//  Created by Gülfem Albayrak on 7.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
//        guard let scene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: scene)
//        let search = SearchRouter.start()
//        let navigationController = UINavigationController(rootViewController: search )
//        window.makeKeyAndVisible()
//        window.rootViewController = search
//        self.window = window
                
//        guard let scene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: scene)
//        let search = SearchRouter.start()
//        let navigationController = UINavigationController(rootViewController: search )
//        window.rootViewController = search
//        self.window = window
//        window.makeKeyAndVisible()
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let search = SearchRouter.start()
        let navigationController = UINavigationController(rootViewController: search)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window


    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {

        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

