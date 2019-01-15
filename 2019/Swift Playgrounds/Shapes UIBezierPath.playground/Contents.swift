import UIKit

let path = UIBezierPath()
path.move(to: .zero)
path.addLine(to: CGPoint(x: 27, y: 100))
path.addLine(to: CGPoint(x: 50, y: 150))
//path.addCurve(to: CGPoint(x: 20, y: 66), controlPoint1: CGPoint(x: 80, y: 27), controlPoint2: CGPoint(x: 0, y: 0))
path.addCurve(to: CGPoint(x: 100, y: 72), controlPoint1: CGPoint(x: 20, y: 27), controlPoint2: CGPoint(x: 69, y: 48))
//path.addLine(to: CGPoint(x: 150, y: 50))
//path.addArc(withCenter: CGPoint(x: 55, y: 55), radius: 18.0, startAngle: 180.0, endAngle: 0.0, clockwise: false)
path.addLine(to: .zero)
