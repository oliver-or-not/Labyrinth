//
//  normalVector.swift
//  Visual_03
//
//  Created by Wonil Lee on 2023/08/15.
//

import Foundation

func normalVector(from a: CGPoint, to b: CGPoint) -> CGPoint {
    let length = CGFloat(sqrt(Double((b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y)))) + 0.000001
    let temp = CGPoint(x: (b.x - a.x) / length, y: (b.y - a.y) / length)
    return temp
}
