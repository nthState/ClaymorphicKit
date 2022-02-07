
import SwiftUI
import ClaymorphicKit

struct MyView: View {
  
  var body: some View {
    Button {
      print("pressed")
    } label: {
      Text("Hello, Earth!")
    }
    .frame(width: 140, height: 56)
    .buttonStyle(ClaymorphicButtonStyle(color: .blue,
                                        radius: 20,
                                        inflation: 0.5))
  }
  
}

#if DEBUG
struct MyView_Preview: PreviewProvider {
  
  static var previews: some View {
    MyView()
  }
  
}
#endif
