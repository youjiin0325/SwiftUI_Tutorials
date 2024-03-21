//
//  LandmarkDetail.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: LandMark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        }
    
    
    var body: some View {
        //body 속성 내부에 래퍼를 사용하여 모델 데이터를 추가합니다 Bindable. 새로운 ;HStack​ 달러 기호( )를 사용하여 속성 에 바인딩을 제공합니다 .FavoriteButtonisFavorite
        @Bindable var modelData =  modelData
        
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
                            Text(landmark.name)
                            Spacer()
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
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
    LandmarkDetail(landmark:ModelData().landmarks[0])
}
