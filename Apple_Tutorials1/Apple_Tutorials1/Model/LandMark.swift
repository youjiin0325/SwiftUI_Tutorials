//
//  LandMark.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import Foundation
import SwiftUI
import CoreLocation //Compute a locationCoordinate property that’s useful for interacting with the MapKit framework.

//adding Codable conformance makes it easier to move data between the structure and a data file
struct LandMark: Hashable, Codable, Identifiable{
    var id:Int
    var name: String
    var park:String
    var state: String
    var description:String
    var isFavorite: Bool //Add an isFavorite property to the Landmark structure.
    var isFeatured: Bool//추가한 다른 랜드마크 속성과 마찬가지로 Bool 은 이미 데이터에 존재하므로 새 속성을 선언
    
    //파일 에는 세 가지 문자열 값 중 하나를 사용하여 각 랜드마크에 대한 값이 이미 포함되어 있습니다 . 데이터 파일의 이름을 일치시키면 구조의 적합성에 따라 데이터를 로드할 수 있습니다.landmarkDatacategoryCodable
    var category: Category
        enum Category: String, CaseIterable, Codable {
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"
        }


    
    //Add an imageName property to read the name of the image from the data,
    // make the property private because users of the Landmarks structure care only about the image itself.
    
    private var imageName: String
     var image: Image {
         Image(imageName)
     }
    
    
    //Add a coordinates property to the structure using a nested Coordinates type that reflects the storage in the JSON data structure.
    
    //You mark this property as private because you’ll use it only to create a public computed property in the next step.
    private var coordinates: Coordinates
    
    //Compute a locationCoordinate property that’s useful for interacting with the MapKit framework.
    var locationCoordinate: CLLocationCoordinate2D {
           CLLocationCoordinate2D(
               latitude: coordinates.latitude,
               longitude: coordinates.longitude)
       }
    
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
    
}
