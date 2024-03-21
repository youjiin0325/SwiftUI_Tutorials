//
//  CategoryHome.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/15/24.
//

import SwiftUI

struct CategoryHome: View {
    
    //카테고리 액세스하고 나중에 다른 랜드마크 데이터에도 액세스함
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    
    var body: some View {
        NavigationSplitView{
            List{
                //첫 번째 주요 랜드마크의 이미지를 목록 상단에 추가
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())//첫번째 이미지가 가장자리에 위치하게 만듬
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {key in
                    
                    //행 유형의 인스턴스에 카테고리 정보를 전달하려면 본문을 업데이트
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)//콘텐츠에 더 적합한 목록 스타일을 선택하려면 수정자를 추가하세요 .listStyle
            
            
                .navigationTitle("Featured")
                .toolbar{
                    //수정자를 사용하여 탐색 모음에 사용자 프로필 버튼을 추가 하고 사용자가 탭할 때 뷰를 표시
                    Button{
                        showingProfile.toggle()
                    }label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }.sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
            
        } detail: {
            Text("Select a Landmark!")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
