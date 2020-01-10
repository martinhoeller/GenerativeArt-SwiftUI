import UIKit

struct Palette {
    let colors: [UIColor]
}

extension Palette {
    static let standard = Palette(colors: [
        UIColor(red:0.98, green:0.93, blue:0.41, alpha:1.0),
        UIColor(red:0.94, green:0.54, blue:0.36, alpha:1.0),
        UIColor(red:0.72, green:0.23, blue:0.37, alpha:1.0),
        UIColor(red:0.42, green:0.17, blue:0.44, alpha:1.0),
        UIColor(red:0.45, green:0.71, blue:0.61, alpha:1.0),
        UIColor(red:0.00, green:0.34, blue:0.57, alpha:1.0)
    ])
}
