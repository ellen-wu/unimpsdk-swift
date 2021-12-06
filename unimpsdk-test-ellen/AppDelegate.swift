//
//  AppDelegate.swift
//  unimpsdk-test-ellen
//
//  Created by mac on 2021/11/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // 小程序要新建窗口 还是怎么的 加上这个就不会crash
    var window: UIWindow?
    
    let UNIAPP_ID = "__UNI__3A6E687"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        checkUniMPResource()
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
    
    // uniapp sdk
    func applicationDidEnterBackground(_ application: UIApplication) {
        DCUniMPSDKEngine.applicationDidEnterBackground(application)
    }
    func applicationWillResignActive(_ application: UIApplication) {
        DCUniMPSDKEngine.applicationWillResignActive(application)
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        DCUniMPSDKEngine.applicationDidBecomeActive(application)
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        DCUniMPSDKEngine.applicationWillEnterForeground(application)
    }
    func applicationWillTerminate(_ application: UIApplication) {
        DCUniMPSDKEngine.destory()
    }
    
    func checkUniMPResource() {
        let options = NSMutableDictionary.init()
        options.setObject(true, forKey: "debug" as NSCopying)
        
        DCUniMPSDKEngine.initSDKEnvironment(launchOptions: options as! [AnyHashable : Any])
        
        var appRunPath = ""
        if DCUniMPSDKEngine.isExistsApp(UNIAPP_ID) {
            appRunPath = DCUniMPSDKEngine.getAppRunPath(withAppid: UNIAPP_ID)
            
            print("=== 小程序运行路径：\(appRunPath)")
        }
        
        let appPath = Bundle.main.path(forResource: UNIAPP_ID, ofType: "wgt")

        // 如果运行的路径不一致 使用最新代码的路径
        if appRunPath != appPath {
            if DCUniMPSDKEngine.releaseAppResourceToRunPath(withAppid: UNIAPP_ID, resourceFilePath: appPath!) {
                print(" === 小程序已加载: \(appPath!)")
            }
        }
    }


}

