//
//  AppDelegate.swift
//  Values
//
//  Created by Jake Pitkin on 1/15/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var xSlider: UISlider?
    var ySlider: UISlider?
    var xValue: UILabel?
    var yValue: UILabel?
    var xLabel: UILabel?
    var yLabel: UILabel?
    
    var addition: UILabel?
    var subtraction: UILabel?
    var multiplication: UILabel?
    var division: UILabel?
    var modulo: UILabel?
    
    var xBinary: UILabel?
    var yBinary: UILabel?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // A view controller contains a view
        let rootViewController: UIViewController = UIViewController()
        rootViewController.view.backgroundColor = UIColor.grayColor()
        
        // CGRectMake x pos, y pos, x size, y size
        xSlider = UISlider(frame: CGRectMake(65, 100, 180, 30))
        xValue = UILabel(frame: CGRectMake(260, 100, 50, 30))
        xLabel = UILabel(frame: CGRectMake(40, 100, 200, 30))
        xSlider?.addTarget(self, action: "sliderChanged", forControlEvents: UIControlEvents.ValueChanged)
        rootViewController.view.addSubview(xValue!)
        rootViewController.view.addSubview(xSlider!)
        rootViewController.view.addSubview(xLabel!)
        
        ySlider = UISlider(frame: CGRectMake(65, 160, 180, 30))
        yValue = UILabel(frame: CGRectMake(260, 160, 50, 30))
        yLabel = UILabel(frame: CGRectMake(40, 160, 200, 30))
        ySlider?.addTarget(self, action: "sliderChanged", forControlEvents: UIControlEvents.ValueChanged)
        rootViewController.view.addSubview(yValue!)
        rootViewController.view.addSubview(ySlider!)
        rootViewController.view.addSubview(yLabel!)
        
        addition = UILabel(frame: CGRectMake(130, 220, 200, 30))
        subtraction = UILabel(frame: CGRectMake(130, 260, 200, 30))
        multiplication = UILabel(frame: CGRectMake(130, 300, 200, 30))
        division = UILabel(frame: CGRectMake(130, 340, 200, 30))
        modulo = UILabel(frame: CGRectMake(130, 380, 200, 30))
        xBinary = UILabel(frame: CGRectMake(100, 420, 200, 30))
        yBinary = UILabel(frame: CGRectMake(100, 460, 200, 30))
        rootViewController.view.addSubview(addition!)
        rootViewController.view.addSubview(subtraction!)
        rootViewController.view.addSubview(multiplication!)
        rootViewController.view.addSubview(division!)
        rootViewController.view.addSubview(modulo!)
        rootViewController.view.addSubview(xBinary!)
        rootViewController.view.addSubview(yBinary!)
        
        xSlider?.minimumValue = 0
        xSlider?.maximumValue = 100
        xSlider?.value = 50
        xLabel!.text = "X"
        
        ySlider?.minimumValue = 0
        ySlider?.maximumValue = 100
        ySlider?.value = 50
        yLabel!.text = "Y"

        sliderChanged()
        
        window = UIWindow()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func sliderChanged() {
        let xSliderValue: Int = Int(xSlider!.value)
        let ySliderValue: Int = Int(ySlider!.value)
        let sum: Int = xSliderValue + ySliderValue
        let difference: Int = xSliderValue - ySliderValue
        let product: Int = xSliderValue * ySliderValue
        let quotient: Double = Double(xSliderValue) / Double(ySliderValue)
        let modulus: String = ySliderValue == 0 ? "Undefined" : String(xSliderValue % ySliderValue)
        let xBinaryString: String = String(xSliderValue, radix: 2)
        let yBinaryString: String = String(ySliderValue, radix: 2)
        
        xValue!.text = "\(xSliderValue)"
        yValue!.text = "\(ySliderValue)"
        addition!.text = "X + Y: \(sum)"
        subtraction!.text = "X - Y: \(difference)"
        multiplication!.text = "X * Y: \(product)"
        if (ySliderValue == 0) {
            division!.text = "X / Y: Undefined"
        }
        else {
            division!.text = "X / Y: \(Double(round(10000*quotient)/10000))"
        }
        modulo!.text = "X % Y: \(modulus)"
        xBinary!.text = "X Binary: \(xBinaryString)"
        yBinary!.text = "Y Binary: \(yBinaryString)"
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

