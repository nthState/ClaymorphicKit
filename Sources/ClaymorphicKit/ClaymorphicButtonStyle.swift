//
//  File.swift
//  
//
//  Created by Chris Davis on 30/12/2021.
//

import SwiftUI

public struct ClaymorphicButtonStyle: ButtonStyle {
  
  private var radius: CGFloat = 80
  private var inflation: CGFloat = 20
  private var shadowRadius: CGFloat = 32
  
  private var color: Color = .blue
  private var shadowColor: Color = .blue
  private var lightColor: Color = .blue
  private var darkColor: Color = .blue
  
  public static var stiffJiggle: Animation = Animation.spring(response: 0.1, dampingFraction: 0.11, blendDuration: 0.0)
  public static var wiggleJiggle: Animation = Animation.spring(response: 0.1, dampingFraction: 0.09, blendDuration: 0.0)
  
  //var animation = Animation.easeOut(duration: 0.2)
  private var animation = Animation.spring(response: 1.0, dampingFraction: 0.1, blendDuration: 0)
  
  public init(color: Color, radius: CGFloat = 20, inflation: CGFloat = 1, shadowRadius: CGFloat = 32, animation: Animation = Animation.easeOut(duration: 0.2)) {
    self.init(color: color,
              lightColor: color.lighter(by: 0.2),
              darkColor: color.darker(by: 0.2),
              shadowColor: color.darker(by: 0.4),
              shadowRadius: shadowRadius,
              radius: radius,
              inflation: inflation,
              animation: animation)
  }
  
  public init(color: Color, lightColor: Color, darkColor: Color, shadowColor: Color, shadowRadius: CGFloat = 32, radius: CGFloat = 20, inflation: CGFloat = 1, animation: Animation = Animation.easeOut(duration: 0.2)) {
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
    
//    GeometryReader { geometry in
//
//      ZStack(alignment: .center) {
//        configuration.label
//          .zIndex(100)
//      }
//      .frame(width: geometry.size.width, height: geometry.size.height)
//      .background( // shadow
//        shape(configuration: configuration)
//          .fill(self.color)
//          .shadow(color: self.shadowColor, radius: self.shadowRadius, x: 24, y: 24)
//          .zIndex(40)
//      )
//      .background( // background color
//        shape(configuration: configuration)
//          .fill(self.color)
//          .zIndex(50)
//          //.grainEffect()
//      )
//      .overlay( // top inner, slightly lighter
//        shape(configuration: configuration)
//          .trim(from: 0, to: 0.5)
//          .stroke(self.lightColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//          .offset(x: 10, y: 10)
//          .blur(radius: 16)
//          .clipShape(shape(configuration: configuration))
//      )
//      .overlay( // bottom inner, slightly darker
//        shape(configuration: configuration)
//          .trim(from: 0.5, to: 1)
//          .stroke(self.darkColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//          .offset(x: 10, y: 10)
//          .blur(radius: 16)
//          .clipShape(shape(configuration: configuration))
//      )
//      .animation(animation, value: configuration.isPressed)
//      //.shadow(color: self.shadowColor, radius: 5, x: 20, y: 20)
//    }
  }
  
//  func shape(configuration: Self.Configuration) -> some Shape {
//    ClaymorphicShape(radius: !configuration.isPressed ? radius : radius * 0.9,
//                     inflation: !configuration.isPressed ? inflation : -inflation)
//  }
}
