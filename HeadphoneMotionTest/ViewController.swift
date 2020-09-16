//
//  ViewController.swift
//  HeadphoneMotionTest
//
//  Created by Koki Ibukuro on 2020/08/11.
//

// Test this
// https://developer.apple.com/forums/thread/650051

import UIKit
import CoreMotion

class ViewController: UIViewController, CMHeadphoneMotionManagerDelegate {
    
    let motionManager = CMHeadphoneMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        motionManager.delegate = self
        
        print("is active", motionManager.isDeviceMotionActive)
        print("is available", motionManager.isDeviceMotionAvailable)
        
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(to: .main)  { (motion: CMDeviceMotion?, error: Error?) in
                print("error \(error)")
                print("motion \(motion)")
            }
            print("started!")
        }
        
    }
    
    deinit {
        motionManager.stopDeviceMotionUpdates()
    }
    
    func headphoneMotionManagerDidConnect(_ manager: CMHeadphoneMotionManager) {
        print("connect")
    }
    
    func headphoneMotionManagerDidDisconnect(_ manager: CMHeadphoneMotionManager) {
        print("disconnect")
    }


}

