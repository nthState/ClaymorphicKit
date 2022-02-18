//
//  ClaymorphicButtonStyle.swift
//  ClaymorphicKit
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/ClaymorphicKit/blob/main/LICENSE for license information.
//

import SwiftUI

/**
 Use the `ClaymorphicButtonStyle` with a SwiftUI Button
 */
public struct ClaymorphicButtonStyle: ButtonStyle {
  
  /// Corner radius
  private var radius: CGFloat = 80
  /// How far the edge extends
  private var inflation: CGFloat = 20
  /// Shadow radius
  private var shadowRadius: CGFloat = 32
  /// Main button color
  private var color: Color = .blue
  /// Shadow color
  private var shadowColor: Color = .blue
  /// Color used at the top of the button
  private var lightColor: Color = .blue
  /// Color used at the bottom of the button
  private var darkColor: Color = .blue
  /// Animation used when interacting with the button
  private var animation = Animation.default
  
  public init(color: Color,
              radius: CGFloat = 20,
              inflation: CGFloat = 1,
              shadowRadius: CGFloat = 32,
              animation: Animation = Animation.easeOut(duration: 0.2)) {
    self.init(color: color,
              lightColor: color.lighter(by: 0.2),
              darkColor: color.darker(by: 0.2),
              shadowColor: color.darker(by: 0.4),
              shadowRadius: shadowRadius,
              radius: radius,
              inflation: inflation,
              animation: animation)
  }
  
  public init(color: Color,
              lightColor: Color,
              darkColor: Color,
              shadowColor: Color,
              shadowRadius: CGFloat = 32,
              radius: CGFloat = 20,
              inflation: CGFloat = 1,
              animation: Animation = Animation.easeOut(duration: 0.2)) {
    self.radius = radius
    self.inflation = inflation
    self.color = color
    self.lightColor = lightColor
    self.darkColor = darkColor
    self.shadowColor = shadowColor
    self.shadowRadius = shadowRadius
    self.animation = animation
  }
  
  public func makeBody(configuration: Self.Configuration) -> some View {
    
    ClaymorphicLayout(color: color,
                      lightColor: lightColor,
                      darkColor: darkColor,
                      shadowColor: shadowColor,
                      shadowRadius: shadowRadius,
                      radius: radius,
                      inflation: inflation,
                      animation: animation)
      .makeBody(content: configuration.label, isPressed: configuration.isPressed, animation: animation)
    
  }

}
