//
//  GameScene.swift
//  Spiraling
//
//  Created by Manjit Bedi on 2015-06-29.
//  Copyright (c) 2015 WhiteHills. All rights reserved.
//

import SpriteKit
import QuartzCore

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        self.createSpiral()
    }
    
    
    // using polar co-ordinates create a spiral starting from the center of
    // of the scene
    func createSpiral() {

        var xOffset:CGFloat
        var yOffset:CGFloat
        
        // we want to start the sprial at the centre of the scene
        xOffset = self.size.width/2.0
        yOffset = self.size.height/2.0
        
        var index:Int
        var angle:CGFloat = 0.0
        let count:Int = 20
        var radius:CGFloat = 10.0
        let angleIncrement:CGFloat = CGFloat(M_PI) * 2.0 / CGFloat(count)
        
        for index in 0...count {
            let node = SKShapeNode(circleOfRadius: 2.0)
            node.strokeColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
            let x = radius * cos(angle) + xOffset
            let y = radius * sin(angle) + yOffset
            node.position = CGPointMake(CGFloat(x), CGFloat(y))
            //print(node.position)
            addChild(node)
            angle += angleIncrement
            radius = radius + 10.0
        }
        
        // TODO: use a bezier path to connect the nodes?
        
        // TODO: create a second spiral offset from the existing spiral
        
        // TODO: fill the area of the region created by the 2 spirals
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
//        for touch in (touches as! Set<UITouch>) {
//            let location = touch.locationInNode(self)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
