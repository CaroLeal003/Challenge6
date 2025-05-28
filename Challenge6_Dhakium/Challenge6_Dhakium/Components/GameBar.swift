//
//  GameBar.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 27/05/25.
//

import Foundation
import SwiftUI

struct GameBar: View {
    let progress: Double
    let color: Color
    let totalWidth: Double
    
    var body: some View {
        let barWidth = CGFloat(progress) * totalWidth
        let isActive = progress > 0 && progress < 1.0
        
        return ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 13)
                .fill(color.opacity(0.5))
                .frame(width: totalWidth, height: 20)
            
            RoundedRectangle(cornerRadius: 13)
                .fill(color)
                .frame(width: barWidth, height: 20)
            
            if isActive {
                Rectangle()
                    .fill(color.opacity(0.5))
                    .frame(width: 10, height: 35)
                    .shadow(color: color, radius: 10)
                    .offset(x: barWidth - 10, y: 0)
            }
        }
    }
}
