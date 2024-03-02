//
//  LandmarkList.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

//Embed the dynamically generated list of landmarks in a NavigationSplitView.

//The navigation split view takes a second input that’s a placeholder for the view that appears after someone makes a selection. On iPhone, the split view doesn’t need the placeholder, but on iPad the detail pane can be present before someone makes a selection, as you’ll see later in this tutorial.
struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            List(landMarks)  {landMark in
                
                //Inside the list’s closure, wrap the returned row in a NavigationLink, specifying the LandmarkDetail view as the destination.
                NavigationLink{
                    LandmarkDetail(landmark: landMark)
                } label: {
                    LandmarkRow(landMark: landMark)
                }
            }
            .navigationTitle("Land Marks")
            
        }detail: {
            Text("Select a LandMark")
        }
    }
}

#Preview {
    LandmarkList()
}
