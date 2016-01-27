//
//  GameScene.swift
//  Spiraling
//
//  Created by Manjit Bedi on 2015-06-29.
//  Copyright (c) 2015 WhiteHills. All rights reserved.
//

import SpriteKit
import QuartzCore

struct Thingy {
    
    var node1:SKShapeNode
    var node2:SKShapeNode
    var node3:SKShapeNode
    var segment1:SKShapeNode
    var segment2:SKShapeNode
}

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        self.createSpiral()
        self.createRandoms()
    }
    
    
    // using polar co-ordinates create a spiral starting from the center of the scene
    func createSpiral() {

        var xOffset:CGFloat
        var yOffset:CGFloat
        
        // we want to start the sprial at the centre of the scene
        xOffset = self.size.width/2.0
        yOffset = self.size.height/2.0
        
        var angle:CGFloat = 0.0
        let count:Int = 20
        var radius:CGFloat = 10.0
        let angleIncrement:CGFloat = CGFloat(M_PI) * 2.0 / CGFloat(count)
        
        
        // set up the shape to draw the path of the spiral
        let line = SKShapeNode()
        let path = CGPathCreateMutable()
        var x1 = xOffset;
        var y1 = yOffset;
        
        for _ in 0...count {
            let node = SKShapeNode(circleOfRadius: 2.0)
            node.strokeColor = UIColor.redColor()
            let x = radius * cos(angle) + xOffset
            let y = radius * sin(angle) + yOffset
            node.position = CGPointMake(CGFloat(x), CGFloat(y))
            //print(node.position)
            addChild(node)
            angle += angleIncrement
            radius = radius + 10.0
            
            //        
            CGPathMoveToPoint(path, nil, x1, y1)
            CGPathAddLineToPoint(path, nil, x, y)
            x1 = x
            y1 = y
        }
        
        // create shape node using the path
        line.path = path
        line.lineWidth = 1
        line.fillColor = UIColor.redColor() // Not sure if this line is actually needed
        line.strokeColor = UIColor.redColor()
        addChild(line)
                
        
        // TODO: create a second spiral offset from the existing spiral
        
        // TODO: fill the area of the region created by the 2 spirals
    }
    
    
    // create some randomly placed line segments in the scene
    func createRandoms(){
     
        // create a composite shape out of three nodes and draw line segments between the nodes
        let count = 20
        let xSpread:Int = Int(self.size.width) - 20
        let ySpread:Int = Int(self.size.height) - 20
        
        let r  = CGPoint.randomPoint
        
        for _ in 1...count{
            
            let startCoord:CGPoint = r.random(rangeX:xSpread, rangeY: ySpread)
            let node1 = SKShapeNode(circleOfRadius: 2.0)
            node1.strokeColor = UIColor.redColor()
            node1.position = startCoord
            addChild(node1)

            var secondCoord:CGPoint = r.random(rangeX:10, rangeY:10)
            secondCoord.x += 20
            secondCoord.y += 20
            
            // the co-ordinates for the line segment are relative to the node's origin.
            let firstPoint = CGPointMake(0, 0)
            var points = [firstPoint, secondCoord]
            let segment1 = SKShapeNode(points: &points, count: 2)
            segment1.position = startCoord
            segment1.strokeColor = UIColor.redColor()
            addChild(segment1)

            secondCoord.x += startCoord.x
            secondCoord.y += startCoord.y
            let node2 = SKShapeNode(circleOfRadius: 2.0)
            node2.strokeColor = UIColor.redColor()
            node2.position = secondCoord;
            addChild(node2)
            
            // TODO: position the next point some distance away from the previous coordinate using angles?
            var thirdCoord:CGPoint = r.random(rangeX:10, rangeY:10)
            let dice = arc4random_uniform(2)
            thirdCoord.x += dice == 0 ? 20 : -20
            let dice2 = arc4random_uniform(2)
            thirdCoord.y += dice2 == 0 ? 20 : -20

            points = [firstPoint, thirdCoord];
            let segment2 = SKShapeNode(points: &points, count: 2)
            segment2.position = startCoord
            segment2.strokeColor = UIColor.redColor()
            addChild(segment2)

            thirdCoord.x += startCoord.x
            thirdCoord.y += startCoord.y
            let node3 = SKShapeNode(circleOfRadius: 2.0)
            node3.strokeColor = UIColor.redColor()
            node3.position = thirdCoord;
            addChild(node3)

            _ = Thingy(node1: node1, node2: node2, node3: node3, segment1: segment1, segment2: segment2)
        }
    }
    

//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }
}
