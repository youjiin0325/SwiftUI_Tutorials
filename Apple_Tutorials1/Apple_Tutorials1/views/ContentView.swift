//
//  ContentView.swift
//  Apple_Tutorials1: Creating and combining views
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //Add the custom MapView
            MapView()
                .frame(height: 300)
            //To layer the image view on top of the map view
            CircoleImage()
                .offset(y: -130)
                .padding(.bottom,-130)
            
            VStack(alignment:.leading){
                Text("Turtle Rocks")
                    .font(.title)
               
                
                HStack {
                    Text("Joshua Tree National Park")
                       
                    Spacer()
                    Text("California")
                    
                }
                .font(.subheadline)
                .foregroundStyle(Color.secondary)
                
                //Add a divider and some additional descriptive text for the landmark.
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title)
                Text("Description text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
