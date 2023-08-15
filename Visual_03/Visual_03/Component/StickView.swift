//
//  StickView.swift
//  Visual_03
//
//  Created by Wonil Lee on 2023/08/15.
//

import SwiftUI

struct StickView: View {
    var color: Color
    
    var body: some View {
        HStack(spacing: -DesignSystem.stickRadius) {
            Capsule()
                .fill(color)
                .frame(width: DesignSystem.stickLength, height: DesignSystem.stickRadius * 2)
        }
    }
    
}

