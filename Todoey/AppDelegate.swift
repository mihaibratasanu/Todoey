//
//  AppDelegate.swift
//  Todoey
//
//  Created by Mihai Bratasanu on 1/3/19.
//  Copyright © 2019 Mihai Bratasanu. All rights reserved.
//

import UIKit

import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      
        print(Realm.Configuration.defaultConfiguration.fileURL)
        

        do {
            _ = try Realm()
        } catch {
            print(error)
        }
        
        return true
    }



}

