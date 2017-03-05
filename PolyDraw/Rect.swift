//
//  Rect.swift
//  PolyDraw
//
//  Created by Chris Chadillon on 2017-03-02.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

// Rect is a subclass of Shape, also called a derived class
class Rect:Shape {
    // It adds a Height and Width the X and Y of the Basic Shape
    var theHeight:Double
    var theWidth:Double
    
    // When we inialize a Rect we must inialize all 4 of its properties
    init(X:Double, Y:Double, theHeight:Double, theWidth:Double) {
        // In Swift we must first inialize the local properties before we
        // call the base inializer, in this case super.init
        self.theHeight = theHeight
        self.theWidth = theWidth
        super.init(X: X, Y: Y)
    }
    
    // We draw the current Rect into the current context that we are given
    override func draw(_ theContext: CGContext) {
        let rect = CGRect(x: self.X, y: self.Y, width: self.theWidth, height: self.theHeight)
        theContext.addRect(rect)
    }
}

















