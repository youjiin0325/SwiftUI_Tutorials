//
//  MapView.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI
import MapKit //gain access to SwiftUI-specific functionality provided by that framework.

struct MapView: View {
    //add a coordinate property to the MapView structure and update the preview to pass a fixed coordinate.
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        //Change the map’s initializer to one that takes a position input so that it updates when the value changes.
        
        Map(position: .constant(.region(region)))
    }
        //Create a private computed variable that holds the region information for the map.
        private var region: MKCoordinateRegion{
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
