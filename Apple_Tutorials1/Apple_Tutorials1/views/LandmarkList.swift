//
//  LandmarkList.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//
//The navigation split view takes a second input that’s a placeholder for the view that appears after someone makes a selection. On iPhone, the split view doesn’t need the placeholder, but on iPad the detail pane can be present before someone makes a selection, as you’ll see later in this tutorial.

import SwiftUI

//Embed the dynamically generated list of landmarks in a NavigationSplitView.

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = true
    //true -> 변경하면 좋아하는 장소만 필터로 걸러서 볼 수 있음
    
    //Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as private.
    
    var filteredLandmarks: [LandMark]{
        landMarks.filter{ landmark in
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
