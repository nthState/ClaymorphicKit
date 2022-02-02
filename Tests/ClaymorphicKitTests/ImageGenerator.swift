//
//  ImageGenerator.swift
//  ClaymorphicKit
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/ClaymorphicKit/blob/master/LICENSE for license information.
//

import SwiftUI
import CoreGraphics

extension View {
  
  func asImage() -> UIImage {
    
    let controller = UIHostingController(rootView: self)
    let view = controller.view
    let targetSize = controller.view.intrinsicContentSize
    let bounds = CGRect(origin: .zero, size: targetSize)
    
    let window = UIWindow()
   
    window.rootViewController = controller
    window.makeKeyAndVisible()
    
    view?.bounds = bounds
    view?.backgroundColor = .clear

    let image = controller.view.asImage()
    
    return image
  }
}

extension UIView {
  
  func asImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(bounds: bounds)
    return renderer.image { rendererContext in
      layer.render(in: rendererContext.cgContext)
    }
  }
  
}
