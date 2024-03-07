//
//  ContentView.swift
//  Apple_Tutorials1: Creating and combining views
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}
//Update the ContentView preview to add the model object to the environment, which makes the object available to any subview.

//A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environment(_:) modifier.
#Preview {
    ContentView().environment(ModelData())
}
