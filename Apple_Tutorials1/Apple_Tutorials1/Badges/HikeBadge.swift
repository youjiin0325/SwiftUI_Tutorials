//
//  HikeBadge.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/17/24.
//""
import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment:.center){
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0/3.0)
                .frame(width: 100,height: 100)
            
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")
            //MARK: 배지는 단순한 그래픽이므로 수정자 와 함께 포함된 텍스트를 통해 다른 사용자가 배지의 의미를 더 명확하게 알 수 있습니다.HikeBadgeaccessibilityLabel(_:)
        }
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
