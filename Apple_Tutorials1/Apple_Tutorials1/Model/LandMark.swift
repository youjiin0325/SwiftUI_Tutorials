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
struct LandMark: Hashable, Codable{
    var id:Int
    var name: String
    var park:String
    var state: String
    var description:String
    
    
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
