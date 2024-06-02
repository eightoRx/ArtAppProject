//
//  SceneDelegate.swift
//  Art App
//
//  Created by Pavel Kostin on 26.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewContrller = ArtViewController()
        let navigationController = UINavigationController(rootViewController: viewContrller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
