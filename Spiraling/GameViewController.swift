//
//  GameViewController.swift
//  Spiraling
//
//  Created by Manjit Bedi on 2015-06-29.
//  Copyright (c) 2015 WhiteHills. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            
            do {
                let sceneData: NSData = try NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
                let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
                archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
                let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
                archiver.finishDecoding()
                return scene
            } catch {
                print("could not open scene file")
                return nil
            }

        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    
    
    // This method will resize the loaded scene file to conform to the size of the
    // of the current application window.
    // 
    // The scene canvas is set to the size of an iPad frame size.
    //
    // We only the re-sizing ot happen once.
    // (may need to adjust this code if the app allows for rotation)
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.size = skView.bounds.size
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

//    override func supportedInterfaceOrientations() -> Int {
//        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
//            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
//        } else {
//            return Int(UIInterfaceOrientationMask.All.rawValue)
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
