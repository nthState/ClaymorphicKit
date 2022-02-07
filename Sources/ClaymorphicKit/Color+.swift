import SwiftUI

internal extension Color {
  
    func lighter(by amount: CGFloat = 0.25) -> Self {
      Self(UIColor(self).lighter(by: amount))
    }
  
    func darker(by amount: CGFloat = 0.25) -> Self {
      Self(UIColor(self).darker(by: amount))
    }
}

internal extension UIColor {
    func mix(with color: UIColor, amount: CGFloat) -> Self {
        var red_lhs: CGFloat = 0
        var green_lhs: CGFloat = 0
        var blue_lhs: CGFloat = 0
        var alpha_lhs: CGFloat = 0

        var red_rhs: CGFloat = 0
        var green_rhs: CGFloat = 0
        var blue_rhs: CGFloat = 0
        var alpha_rhs: CGFloat = 0

        getRed(&red_lhs, green: &green_lhs, blue: &blue_lhs, alpha: &alpha_lhs)
        color.getRed(&red_rhs, green: &green_rhs, blue: &blue_rhs, alpha: &alpha_rhs)

        return Self(
            red: red_lhs * CGFloat(1.0 - amount) + red_rhs * amount,
            green: green_lhs * CGFloat(1.0 - amount) + green_rhs * amount,
            blue: blue_lhs * CGFloat(1.0 - amount) + blue_rhs * amount,
            alpha: 1
        )
    }

    func lighter(by amount: CGFloat = 0.2) -> Self { mix(with: .white, amount: amount) }
    func darker(by amount: CGFloat = 0.2) -> Self { mix(with: .black, amount: amount) }
}
