//
//  ExampleSwiftUIView.swift
//  ClaymorphicKit
//
//  Copyright © 2022 Chris Davis, https://www.nthState.com
//
//  See https://github.com/nthState/ClaymorphicKit/blob/main/LICENSE for license information.
//

import SwiftUI

struct ExampleSwiftUIView {
  @State var animate: Bool = false
}

extension ExampleSwiftUIView: View {
  
  var body: some View {
    
    VStack(spacing: 24) {
      button1
      button2
    }
    
  }
  
  var button1: some View {
    Button {
      
    } label: {
      Text("Hello, Earth!")
    }
    .frame(width: 140, height: 56)
    .buttonStyle(ClaymorphicButtonStyle(color: .blue,
                                        radius: 20,
                                        inflation: 0.5))
  }
  
  var button2: some View {
    Button {
      
    } label: {
      Text("Hello, Mars!")
    }
    .frame(width: 140, height: 56)
    .buttonStyle(ClaymorphicButtonStyle(color: .red,
                                        radius: 20,
                                        inflation: 0.5,
                                        animation: Animation.wiggleJiggle))
  }
  
}

struct ExampleSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleSwiftUIView()
  }
}
