//
//  AppDelegate.swift
//  example-configurartion-schemes
//
//  Created by Paulo Barros on 01/07/20.
//  Exemplo de código retirado do site https://shockoe.com/blog/how-to-setup-configurations-and-schemes-in-xcode/
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if LOCAL
            #if DEBUG
                print("Local development build!* - Debug")
            #else
                print("Local development build!* - Release")
            #endif
        #elseif DEV
            #if DEBUG
                print("Dev build! - Debug")
            #else
                print("Dev build! - Release")
            #endif
        #elseif QA
            #if DEBUG
                print("QA build! - Debug")
            #else
                print("QA build! - Release")
            #endif
        #elseif PROD
            #if DEBUG
                print("Production build! - Debug")
            #else
                print("Production build! - Release")
            #endif
        #endif
        
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

