//
//  extensions.swift
//  Random CGPoint Extension
//
//  Created by chuck on 4/29/15.
//  Copyright (c) 2015 Chuck's Anime Shrine. All rights reserved.
//

import UIKit

//creates random CGPoints in Swift as of XCode Beta 6.4 (6E7)
extension CGPoint {
    
    //private functions that help alieve the ambiguity of the modulo bias and nested typecasting as well as recycle similar functionality for either Int or Range type parameter inputs
    private func randomInt(num:Int) ->Int{
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    private func randomIntFromRange(numRange:Range<Int>) ->Int{
        return Int(arc4random_uniform(UInt32((numRange.endIndex - numRange.startIndex) + numRange.startIndex)))
    }
    
    //private variable for the default range
    private var defaultRange : Int{
        get{return 1000}
    }
    
    //(a) public variable that creates a default random CGPoint
    static var randomPoint = CGPoint.zeroPoint.random()
    
    
    //(b) default random point creation
    func random()->CGPoint { return CGPoint(x:randomInt(defaultRange),y:randomInt(defaultRange))}
    
    //(c) using an Int parameter for both the random x and y range
    func random(range:Int)->CGPoint {
        return CGPoint(x:randomInt(range),y:randomInt(range))
    }
    
    //(d) allows for the specification of the x and y random range
    func random(#rangeX:Int, rangeY:Int)->CGPoint {
        return CGPoint(x:randomInt(rangeX),y:randomInt(rangeY))
    }
    
    //(e) allows the same functionality as (c) but with a Range<Int> type parameter
    func random(range:Range<Int>)->CGPoint {
        return CGPoint(x:randomIntFromRange(range), y:randomIntFromRange(range))
    }
    
    //(f) allows the same functionality as (d) but with a Range<Int> type parameter
    func random(#rangeX:Range<Int>, rangeY:Range<Int> )->CGPoint {
        return CGPoint(x:randomIntFromRange(rangeX), y:randomIntFromRange(rangeY))
    }
    
}