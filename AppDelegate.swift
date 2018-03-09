//
//  AppDelegate.swift
//  G61l10
//
//  Created by Ivan Vasilevich on 3/9/18.
//  Copyright © 2018 RockSoft. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		// Initialize Parse.
		let configuration = ParseClientConfiguration {
			$0.applicationId = "eLKjeIwiPxZBy9JIVdy59m9ZhYuzAhStf3SAnQ6F"
			$0.clientKey = "dzYmyPdsWNMgmEjxuqKfYt5hjZy5DwyuqGDraO3f"
			$0.server = "https://parseapi.back4app.com"
//			$0.isLocalDatastoreEnabled = true
		}
		Parse.initialize(with: configuration)
		
		
		return true
	}


}

