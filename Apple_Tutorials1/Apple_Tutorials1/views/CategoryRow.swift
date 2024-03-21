//
//  CategoryRow.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/17/24.
//

import SwiftUI

struct CategoryRow: View {
    //카테고리 이름과 해당 카테고리의 항목 목록에 대한 속성을 추가합니다.
    var categoryName: String
    var items:[LandMark]
    
    
    var body: some View {
        VStack(alignment:.leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top,5)
            
            //showsIndicators:false 가 뭐지?
            ScrollView(.horizontal, showsIndicators:false) {
                HStack(alignment:.top, spacing: 0){
                    ForEach(items){landmark in
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                        }label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

//왜 리턴을 하는지?/ prefix란 무엇?

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
}
