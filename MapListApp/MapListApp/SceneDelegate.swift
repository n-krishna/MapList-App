//
//  SceneDelegate.swift
//  MapListApp
//
//  Created by Kulwinder Dhaliwal on 2024-11-30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: MapListViewController())
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }
}
