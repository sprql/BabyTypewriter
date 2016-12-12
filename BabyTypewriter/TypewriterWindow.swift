//
//  TypewriterWindow.swift
//  BabyTypewriter
//
//  Created by Alexander Obukhov on 12/4/16.
//  Copyright © 2016 sprql. All rights reserved.
//

import Cocoa

class TypewriterWindow: NSWindow {
    @IBOutlet weak var keyLabel: NSTextField!

    var soundController = SoundController()

    var counter: CGFloat = 1.0
    let bgBrightness: CGFloat = 0.7
    let bgSaturation: CGFloat = 1.0
    let bgAlpha: CGFloat = 1.0
    let bgMaxHue: CGFloat = 360
    let hueStep: CGFloat = 3

    override var canBecomeKey: Bool { get {  return true } }

    func initialize() {
        soundController = SoundController()
        soundController.initialize()
    }

    override func keyDown(with event: NSEvent) {
        if (event.modifierFlags.contains(NSEventModifierFlags.command)) {
            super.keyDown(with: event)
        }

        keyLabel.stringValue = event.characters!
        updateBackground()
        soundController.play()
        counter += hueStep
        if (counter > bgMaxHue) {
            counter = 0
        }
    }

    func updateBackground() {
        self.backgroundColor = NSColor.init(hue: (counter / bgMaxHue), saturation: bgSaturation, brightness: bgBrightness, alpha: bgAlpha)
    }
}
