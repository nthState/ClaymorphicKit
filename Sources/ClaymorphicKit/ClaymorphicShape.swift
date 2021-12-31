//
//  File.swift
//  
//
//  Created by Chris Davis on 30/12/2021.
//

import SwiftUI

public struct ClaymorphicShape: Shape, InsettableShape {
  
  private var radius: CGFloat = 80
  private var inflation: CGFloat = -20
  private var insetAmount: CGFloat = 0
  
  public init(radius: CGFloat = 80, inflation: CGFloat = -20) {
    self.radius = radius
    self.inflation = inflation
  }
  
  public func path(in rect: CGRect) -> Path {
    
    let p = Path { path in
      
      path.move(to: CGPoint(x: 0, y: rect.size.height-radius))
      
      path.addCurve(to: CGPoint(x: 0, y: radius), control1: CGPoint(x: -inflation, y: rect.size.height/2), control2: CGPoint(x: -inflation, y: rect.size.height/2))
      
      path.addCurve(to: CGPoint(x: radius, y: 0), control1: CGPoint(x: 0, y: 0), control2: CGPoint(x: 0, y: 0))
      
      path.addCurve(to: CGPoint(x: rect.size.width-radius, y: 0), control1: CGPoint(x: rect.size.width/2, y: -inflation), control2: CGPoint(x: rect.size.width/2, y: -inflation))
      
      path.addCurve(to: CGPoint(x: rect.size.width, y: radius), control1: CGPoint(x: rect.size.width, y: 0), control2: CGPoint(x: rect.size.width, y: 0))
      
      path.addCurve(to: CGPoint(x: rect.size.width, y: rect.size.height-radius), control1: CGPoint(x: rect.size.width+inflation, y: rect.size.height/2), control2: CGPoint(x: rect.size.width+inflation, y: rect.size.height/2))
      
      path.addCurve(to: CGPoint(x: rect.size.width-radius, y: rect.size.height), control1: CGPoint(x: rect.size.width, y: rect.size.height), control2: CGPoint(x: rect.size.width, y: rect.size.height))
      
      path.addCurve(to: CGPoint(x: radius, y: rect.size.height), control1: CGPoint(x: rect.size.width/2, y: rect.size.height+inflation), control2: CGPoint(x: rect.size.width/2, y: rect.size.height+inflation))
      
      path.addCurve(to: CGPoint(x: 0, y: rect.size.height-radius), control1: CGPoint(x: 0, y: rect.size.height), control2: CGPoint(x: 0, y: rect.size.height))
      
    }
    
    return p.offsetBy(dx: insetAmount, dy: insetAmount)
  }
  
  public func inset(by amount: CGFloat) -> some InsettableShape {
    var shape = self
    shape.insetAmount += amount
    return shape
  }
  
  public var animatableData: AnimatablePair<CGFloat, CGFloat> {
    get { AnimatablePair(inflation, radius) }
    set { (inflation, radius) = (newValue.first, newValue.second) }
  }
}
