//
//  Animation+.swift
//  ClaymorphicKit
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/ClaymorphicKit/blob/master/LICENSE for license information.
//

import SwiftUI

extension Animation {
  
  /// A stiff jiggle that's quite quick
  public static var stiffJiggle: Animation = Animation.spring(response: 0.1, dampingFraction: 0.11, blendDuration: 0.0)
  
  /// A fun wiggle that lasts
  public static var wiggleJiggle: Animation = Animation.spring(response: 0.1, dampingFraction: 0.09, blendDuration: 0.0)
  
}
