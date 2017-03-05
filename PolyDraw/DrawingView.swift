//
//  DrawingView.swift
//  PolyDraw
//
//  Created by Chris Chadillon on 2017-03-02.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    // Our DrawingView has 2 main properties:
    //
    // 1 - What type of Shape we are currently adding
    // 2 - An array of shape objects
    
    var shapeType = 0
    var theShapes = [Shape]()
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // Time to draw the drawingView
        
        // To draw, we always need a context
        let possibleContext = UIGraphicsGetCurrentContext()
        
        // As long as we were able to obtain a valid context, let us do some drawing
        if let theContext = possibleContext {
            // First we need to setup out drawing environment
            
            // We will set the Line Width
            theContext.setLineWidth(1.0)
            
            // We need on RGBA color
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            
            // We need to RGBA color components
            let components:[CGFloat] = [0.0, 0.0, 1.0, 1.0]
            
            // We have what we need, let us make the color
            let color = CGColor(colorSpace: colorSpace, components: components)
            
            // We will set the stroke color of the context to the color we jus built
            theContext.setStrokeColor(color!)
            
            // Time to draw each of the shapes in the array into the context
            for aShape in self.theShapes {
                aShape.draw(theContext)
            }
            
            // Stroke all the paths we just added the context
            theContext.strokePath()
        }
    }

    // touchesBegan is called when one one more touches are sensed on the drawingView
    // for this simple demo, we only care about the first touch.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the first touch for the touches array
        let touch = touches.first! as UITouch
        // Get the location from the first touch
        let location = touch.location(in: self)
        
        // Depending on the current shape type, eithe add a Rect or an Oval to the array
        // of shapes
        
        if shapeType == 0 {
            self.theShapes.append(Rect(X:Double(location.x),
                                       Y:Double(location.y),
                                       theHeight: 20,
                                       theWidth:20))
        } else {
            self.theShapes.append(Oval(X:Double(location.x),
                                       Y:Double(location.y),
                                       theHeight: 20,
                                       theWidth:20))
        }
        
        // Since we added a new shape to the array, we better tell the system that
        // our drawing view needs to be redrawn
        self.setNeedsDisplay()
    }
 
}





