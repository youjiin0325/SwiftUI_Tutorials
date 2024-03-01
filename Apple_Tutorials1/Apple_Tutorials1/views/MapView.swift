//
//  MapView.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI
import MapKit //gain access to SwiftUI-specific functionality provided by that framework.

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
        //Create a private computed variable that holds the region information for the map.
        private var region: MKCoordinateRegion{
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
                           span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView()
}
