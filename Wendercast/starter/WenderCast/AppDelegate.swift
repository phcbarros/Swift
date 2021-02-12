/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import SafariServices
import UserNotifications

enum Identifiers {
  static let viewAction = "VIEW_IDENTIFIER"
  static let newsCategory = "NEWS_CATEGORY"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UITabBar.appearance().barTintColor = UIColor.themeGreenColor
    UITabBar.appearance().tintColor = UIColor.white

    registerForPushNotifications()
    
    // Check if lauched from notification
    let notificationOption = launchOptions?[.remoteNotification]
    print("launched \(notificationOption)")
    
    if
      let notification = notificationOption as? [String: AnyObject],
      let aps = notification["aps"] as? [String: AnyObject]
      {
      NewsItem.makeNewsItem(aps)
      (window?.rootViewController as? UITabBarController)?.selectedIndex = 1
    }
    
    return true
  }
  
  func registerForPushNotifications() {
    UNUserNotificationCenter.current()
      .requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted,  _ in
        print("Permission granted: \(granted)")
        guard granted else { return }
        
        let viewAction = UNNotificationAction(
          identifier: Identifiers.viewAction,
          title: "View",
          options: [.foreground]
        )
        
        let newsCategory = UNNotificationCategory(
          identifier: Identifiers.newsCategory,
          actions: [viewAction],
          intentIdentifiers: [],
          options: []
        )
        
        UNUserNotificationCenter.current().setNotificationCategories([newsCategory])
        self?.getNotificationSettings()
      }
  }
  
  // Get information about notification
  func getNotificationSettings() {
    UNUserNotificationCenter.current()
      .getNotificationSettings { settings in
        print("Notification settings: \(settings)")
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
      }
  }
  
  // Success registerForPushNotification
  func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ){
    let tokenParts = deviceToken.map { data in String(format:  "%02.2hhx", data) }
    let token = tokenParts.joined()
    print("Device TokenL: \(token)")
  }
  
  // Fail  registerForPushNotification
  func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ){
    print("Failed to register:  \(error)")
  }
  
  // Handle notification when app is running
  func application(
    _  application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable: Any],
    fetchCompletionHandler completionHandler:
    @escaping (UIBackgroundFetchResult) -> Void
  ) {
    guard let aps = userInfo["aps"] as? [String: AnyObject] else {
      completionHandler(.failed)
      return
    }
    NewsItem.makeNewsItem(aps);
    //(window?.rootViewController as? UITabBarController)?.selectedIndex = 1
  }
}
