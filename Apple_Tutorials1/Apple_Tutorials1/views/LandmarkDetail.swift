//
//  LandmarkDetail.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: LandMark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                        .frame(height: 300)

            CircleImage(image: landmark.image)
                        .offset(y: -130)
                        .padding(.bottom, -130)


                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .font(.title)


                        HStack {
                            Text(landmark.park)
                            Spacer()
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)


                        Divider()


                        Text("About \(landmark.name)")
                            .font(.title2)
                        Text(landmark.description)
               }
                .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)//BarTitleDisplayMode(_:) modifier to make the title appear inline.
    }
}

#Preview {
    LandmarkDetail(landmark: landMarks[0])
}
