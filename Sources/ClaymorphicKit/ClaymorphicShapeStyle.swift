//
//  File.swift
//  
//
//  Created by Chris Davis on 30/12/2021.
//

import SwiftUI

public extension View {
  
  func claymorphicStyle(color: Color, radius: CGFloat = 20, inflation: CGFloat = 1) -> some View {
    modifier(ClaymorphicShapeStyle(color: color, radius: radius, inflation: inflation))
  }
  
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
  
  private var animation = Animation.spring(response: 1.0, dampingFraction: 0.1, blendDuration: 0)
  
  private var isAnimating: Bool = false
  
  public init(color: Color, radius: CGFloat = 20, inflation: CGFloat = 1, shadowRadius: CGFloat = 32, isAnimating: Bool = false, animation: Animation = Animation.easeOut(duration: 0.2)) {
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
  
  public init(color: Color, lightColor: Color, darkColor: Color, shadowColor: Color, shadowRadius: CGFloat = 32, radius: CGFloat = 20, inflation: CGFloat = 1, isAnimating: Bool = false, animation: Animation = Animation.easeOut(duration: 0.2)) {
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
    
//    GeometryReader { geometry in
//
//      ZStack(alignment: .center) {
//        content
//          .zIndex(100)
//      }
//      .frame(width: geometry.size.width, height: geometry.size.height)
//      .background( // shadow
//        shape()
//          .fill(self.color)
//          .shadow(color: self.shadowColor, radius: self.shadowRadius, x: 24, y: 24)
//          .zIndex(40)
//      )
//      .background( // background color
//        shape()
//          .fill(self.color)
//          .zIndex(50)
//      )
//      .overlay( // top inner, slightly lighter
//        shape()
//          .trim(from: 0, to: 0.5)
//          .stroke(self.lightColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//          .offset(x: 10, y: 10)
//          .blur(radius: 16)
//          .clipShape(shape())
//      )
//      .overlay( // bottom inner, slightly darker
//        shape()
//          .trim(from: 0.5, to: 1)
//          .stroke(self.darkColor, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//          .offset(x: 10, y: 10)
//          .blur(radius: 16)
//          .clipShape(shape())
//      )
//
//    }
  }
  
//  func shape() -> some Shape {
//    ClaymorphicShape(radius: radius, inflation: inflation)
//  }
  
}

//public struct ClaymorphicShapeStyle: ShapeStyle {
//
//  public init() {
//
//  }
//
//  public func _apply(to shape: inout _ShapeStyle_Shape) {
//
//  }
//
//}
//
///// Default View.body implementation to fill a Rectangle with `self`.
//extension ShapeStyle where Self: View, Self.Body == _ShapeView<Rectangle, Self> {
//
//    public var body: _ShapeView<Rectangle, Self> {
//        _ShapeView(shape: Rectangle(), style: self)
//    }
//}
//
//
//
//public struct _ShapeStyle_Shape {
//  public let operation: Operation
//  public var result: Result
//  public var environment: EnvironmentValues
//  public var bounds: CGRect?
//  public var role: ShapeRole
//  public var inRecursiveStyle: Bool
//
//  public init(
//    for operation: Operation,
//    in environment: EnvironmentValues,
//    role: ShapeRole
//  ) {
//    self.operation = operation
//    result = .none
//    self.environment = environment
//    bounds = nil
//    self.role = role
//    inRecursiveStyle = false
//  }
//
//  public enum Operation {
//    case prepare(Text, level: Int)
//    case resolveStyle(levels: Range<Int>)
//    case fallbackColor(level: Int)
//    case multiLevel
//    case copyForeground
//    case primaryStyle
//    case modifyBackground
//  }
//
//  public enum Result {
//    case prepared(Text)
//    //case resolved(_ResolvedStyle)
//    case style(AnyShapeStyle)
//    case color(Color)
//    case bool(Bool)
//    case none
//
////    public func resolvedStyle(
////      on shape: _ShapeStyle_Shape,
////      in environment: EnvironmentValues
////    ) -> _ResolvedStyle? {
////      switch self {
////      case let .resolved(resolved): return resolved
////      case let .style(anyStyle):
////        var copy = shape
////        anyStyle._apply(to: &copy)
////        return copy.result.resolvedStyle(on: shape, in: environment)
//////      case let .color(color):
//////        return .color(color.provider.resolve(in: environment))
////      default:
////        return nil
////      }
////    }
//  }
//}
////
////public indirect enum _ResolvedStyle {
////  case color(AnyColorBox.ResolvedValue)
//////  case paint(AnyResolvedPaint) // I think is used for Image as a ShapeStyle (SwiftUI.ImagePaint).
////  case foregroundMaterial(AnyColorBox.ResolvedValue, _MaterialStyle)
//////  case backgroundMaterial(AnyColorBox.ResolvedValue)
////  case array([_ResolvedStyle])
////  case opacity(Float, _ResolvedStyle)
//////  case multicolor(ResolvedMulticolorStyle)
////  case gradient(Gradient, style: _GradientStyle)
////
////  public func color(at level: Int) -> Color? {
////    switch self {
////    case let .color(resolved):
////      return Color(_ConcreteColorBox(resolved))
////    case let .foregroundMaterial(resolved, _):
////      return Color(_ConcreteColorBox(resolved))
////    case let .array(children):
////      return children[level].color(at: level)
////    case let .opacity(opacity, resolved):
////      guard let color = resolved.color(at: level) else { return nil }
////      return color.opacity(Double(opacity))
////    case let .gradient(gradient, _):
////      return gradient.stops.first?.color
////    }
////  }
////}
