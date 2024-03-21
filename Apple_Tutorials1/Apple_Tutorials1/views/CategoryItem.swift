//
//  CategoryItem.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/17/24.
//

import SwiftUI

struct CategoryItem: View {
    var landmark:LandMark
    
    var body: some View {
        VStack(alignment: .leading){
            landmark.image
                .renderingMode(.original)//및 수정자를 적용하여 카테고리 항목의 탐색 모양을 변경합니다 .renderingMode(_:)foregroundStyle(_:)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(landmark.name)
                .foregroundStyle(Color.primary)
                .font(.caption)
            
        }
        .padding(.leading,15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
