//
//  LandmarkList.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI


struct LandmarkList: View {
    
    //The modelData property gets its value automatically, as long as the environment(_:) modifier has been applied to a parent. The @Environment property wrapper enables you to read the model data of the current view. Adding an environment(_:) modifier passes the data object down through the environment.
    @Environment(ModelData.self) var modelData //
    @State private var showFavoritesOnly = false
    //true -> 변경하면 좋아하는 장소만 필터로 걸러서 볼 수 있음
    
    //Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as private.
    
    var filteredLandmarks: [LandMark]{
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            
        }
    }

    
    var body: some View {
        NavigationSplitView {
            List{ 
                
                //Toggle의  $showFavoritesOnly를 기준으로 true or false 가 될 지 선택 가능
                Toggle(isOn: $showFavoritesOnly ) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {landMark in
                
                NavigationLink{
                    LandmarkDetail(landmark: landMark)
                } label: {
                    LandmarkRow(landMark: landMark)
                }
            }
        }
        .animation(.default, value: filteredLandmarks)
        .navigationTitle("Land Marks")
            
        }detail: {
            Text("Select a LandMark")
        }
    }
}

#Preview {
    LandmarkList()
}
