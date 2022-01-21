//
//  ClaymorphicShape.swift
//  ClaymorphicKit
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/ClaymorphicKit/blob/master/LICENSE for license information.
//

import XCTest
import SwiftUI
import UIKit
@testable import ClaymorphicKit

final class ClaymorphicKitTests: XCTestCase {
  
  /// TODO: Generated image doesn't look like view
  func test_generated_view_matches() throws {
    
    let swiftUIView = Button {
      
    } label: {
      Text("Hello, World!")
    }
      .frame(width: 140, height: 56)
      .buttonStyle(ClaymorphicButtonStyle(color: .blue,
                                          radius: 20,
                                          inflation: 0.5))
    
    let image = swiftUIView.asImage()
    
    // Uncomment next line to generate image
    //let _ = try image.save(to: URL(fileURLWithPath: "/Users/chrisdavis/Tests/test_1.jpg"))
    
    // Actual
    let actual_url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("generated_1.jpg")
    let _ = try image.save(to: actual_url)
    
    // Expected
    let expected_url = Bundle.module.url(forResource: "test_1", withExtension: "jpg")!
    
    let result = FileManager.default.contentsEqual(atPath: actual_url.path, andPath: expected_url.path)
    XCTAssertTrue(result, "Generated image should match")
  }
  
}
