//
//  AppDelegate.swift
//  BabyTypewriter
//
//  Created by Alexander Obukhov on 12/10/16.
//  Copyright © 2016 sprql. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: TypewriterWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.window.setFrame((NSScreen.main()?.frame)!, display: true)
        self.window.collectionBehavior = NSWindowCollectionBehavior.fullScreenPrimary
        self.window.toggleFullScreen(self)

        self.window.initialize()
        self.window.updateBackground()
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }


}

