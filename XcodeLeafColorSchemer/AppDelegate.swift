//
//  AppDelegate.swift
//  XcodeLeafColorSchemer
//
//  Created by Ashok Gelal on 1/19/17.
//  Copyright © 2017 ashokgelal. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var linkField: NSTextField!
    private let url = "https://ashokgelal.com"

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        linkField.attributedStringValue = link_string(text: url, url: NSURL(string: url)!)
        let gesture = NSClickGestureRecognizer()
        gesture.buttonMask = 0x1 // left mouse
        gesture.numberOfClicksRequired = 1
        gesture.target = self
        gesture.action = #selector(AppDelegate.visitSite(_:))
        linkField.addGestureRecognizer(gesture)
    }

    private func link_string(text:String, url:NSURL) -> NSMutableAttributedString {
        // initially set viewable text
        let attrString = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: attrString.length)
        attrString.beginEditing()
        // stack URL
        attrString.addAttribute(NSLinkAttributeName, value: url.absoluteString!, range: range)
        attrString.endEditing()
        return attrString
    }

    func visitSite(_ sender: Any) {
        NSWorkspace.shared().open(URL(string: url)!)
    }
}

