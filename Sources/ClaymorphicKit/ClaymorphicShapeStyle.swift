//
//  ClaymorphicShapeStyle.swift
//  ClaymorphicKit
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/ClaymorphicKit/blob/master/LICENSE for license information.
//

import SwiftUI

public extension View {
  
  /// Claymorphic style that takes a base color and calculates lighter and darker colours automatically
  /// - Parameters:
  ///   - color: base color
  ///   - radius: corner radius
  ///   - inflation: how far the midpoint per length extends
  /// - Returns: View
  func claymorphicStyle(color: Color, radius: CGFloat = 20, inflation: CGFloat = 1) -> some View {
    modifier(ClaymorphicShapeStyle(color: color, radius: radius, inflation: inflation))
  }
  
  /// Claymorphic style that takes a color per style
  /// - Parameters:
  ///   - color: base color
  ///   - lightColor: lighter base color
  ///   - darkColor: darker base color
  ///   - shadowColor: shadow color
  ///   - radius: corner radius
  ///   - inflation: how far the midpoint per length extends
  /// - Returns: View
  func claymorphicStyle(color: Color, lightColor: Color, darkColor: Color, shadowColor: Color, radius: CGFloat = 20, inflation: CGFloat = 1) -> some View {
    modifier(ClaymorphicShapeStyle(color: color, lightColor: lightColor, darkColor: darkColor, shadowColor: shadowColor, radius: radius, inflation: inflation))
  }
}

public struct ClaymorphicShapeStyle: ViewModifier {
  
  private var radius: CGFloat = 80
  private var inflation: CGFloat = 20
  private var shadowRadius: CGFloat = 32
  
  private var color: Color = .blue
  private var shadowColor: Color = .blue
  private var lightColor: Color = .blue
  private var darkColor: Color = .blue
  
  private var animation = Animation.default
  
  private var isAnimating: Bool = false
  
  public init(color: Color,
              radius: CGFloat = 20,
              inflation: CGFloat = 1,
              shadowRadius: CGFloat = 32,
              isAnimating: Bool = false,
              animation: Animation = Animation.easeOut(duration: 0.2)) {
    self.init(color: color,
              lightColor: color.lighter(by: 0.2),
              darkColor: color.darker(by: 0.2),
              shadowColor: color.darker(by: 0.4),
              shadowRadius: shadowRadius,
              radius: radius,
              inflation: inflation,
              isAnimating: isAnimating,
              animation: animation)
  }
  
  public init(color: Color,
              lightColor: Color,
              darkColor: Color,
              shadowColor: Color,
              shadowRadius: CGFloat = 32,
              radius: CGFloat = 20,
              inflation: CGFloat = 1,
              isAnimating: Bool = false,
              animation: Animation = Animation.easeOut(duration: 0.2)) {
    self.radius = radius
    self.inflation = inflation
    self.color = color
    self.lightColor = lightColor
    self.darkColor = darkColor
    self.shadowColor = shadowColor
    self.shadowRadius = shadowRadius
    self.isAnimating = isAnimating
    self.animation = animation
  }
  
  public func body(content: Content) -> some View {
    
    ClaymorphicLayout(color: color,
                      lightColor: lightColor,
                      darkColor: darkColor,
                      shadowColor: shadowColor,
                      shadowRadius: shadowRadius,
                      radius: radius,
                      inflation: inflation,
                      animation: animation)
      .makeBody(content: content, isPressed: isAnimating, animation: animation)
  }

}
