//
//  AppDelegate.swift
//  RoomObjectReplicatorDemo
//
//  Created by Jack Mousseau on 6/7/22.
//

import UIKit
import RoomObjectReplicator

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        RoomObjectComponent.registerComponent()
        RoomObjectSystem.registerSystem()
        return true
    }

}

