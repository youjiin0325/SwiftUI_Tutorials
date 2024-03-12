//
//  RotatedBadgeSymbol.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/12/24.
//
import SwiftUI


struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}


#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
