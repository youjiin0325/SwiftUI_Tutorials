//
//  Apple_Tutorials1App.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

//Update the LandmarksApp to create a model instance and supply it to ContentView using the environment(_:) modifier.

//Use the @State attribute to initialize a model object the same way you use it to initialize properties inside a view. Just like SwiftUI initializes state in a view only once during the lifetime of the view, it initializes state in an app only once during the lifetime of the app.

@main
struct Apple_Tutorials1App: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
