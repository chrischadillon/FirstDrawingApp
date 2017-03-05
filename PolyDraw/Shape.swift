//
//  Shape.swift
//  PolyDraw
//
//  Created by Chris Chadillon on 2017-03-02.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

// Base class for the Shape Hierarchy

class Shape {
    // A basic Shape only has an X and Y cooridnate
    var X:Double
    var Y:Double
    
    // Basic initalizer for Shape
    init(X:Double, Y:Double) {
        self.X = X
        self.Y = Y
    }
    
    // This method is only implemented in "Real" derived shapes
    func draw(_ theContext:CGContext){}
}





















