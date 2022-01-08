//
//  ClaymorphicLayout.swift
//  ClaymorphicKit
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/ClaymorphicKit/blob/master/LICENSE for license information.
//

import SwiftUI

public struct ClaymorphicLayout<Content> where Content: View {
  
  private var radius: CGFloat = 80
  private var inflation: CGFloat = 20
  private var shadowRadius: CGFloat = 32
  
  private var color: Color = .blue
  private var shadowColor: Color = .blue
  private var lightColor: Color = .blue
  private var darkColor: Color = .blue
  
  private var animation = Animation.default
  
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

  public func makeBody(content: Content, isPressed: Bool, animation: Animation) -> some View {
    GeometryReader { geometry in
      
      ZStack(alignment: .center) {
        content
          .zIndex(100)
      }
      .frame(width: geometry.size.width, height: geometry.size.height)
      .background( // shadow
        shape(isPressed: isPressed)
          .fill(self.color)
          .shadow(color: self.shadowColor, radius: self.shadowRadius, x: 24, y: 24)
          .zIndex(40)
      )
      .background( // background color
        shape(isPressed: isPressed)
          .fill(self.color)
          .zIndex(50)
          //.grainEffect()
      )
      .overlay( // top inner, slightly lighter
        shape(isPressed: isPressed)
          .trim(from: 0, to: 0.5)
          .stroke(self.lightColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
          .offset(x: 10, y: 10)
          .blur(radius: 16)
          .clipShape(shape(isPressed: isPressed))
      )
      .overlay( // bottom inner, slightly darker
        shape(isPressed: isPressed)
          .trim(from: 0.5, to: 1)
          .stroke(self.darkColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
          .offset(x: 10, y: 10)
          .blur(radius: 16)
          .clipShape(shape(isPressed: isPressed))
      )
      .animation(animation, value: isPressed)
      //.shadow(color: self.shadowColor, radius: 5, x: 20, y: 20)
    }
  }

  func shape(isPressed: Bool) -> some Shape {
    ClaymorphicShape(radius: !isPressed ? radius : radius * 0.9,
                     inflation: !isPressed ? inflation : -inflation)
  }

}
