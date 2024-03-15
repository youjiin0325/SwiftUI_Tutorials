//
//  Hike.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/15/24.
//

import Foundation


struct Hike : Codable, Hashable, Identifiable {
    var id : Int
    var name: String
    var distance : Double
    var difficulty : Int
    var observations :[Observation]
    
    static var formatter = LengthFormatter() // 무엇을 포맷하는지?
    
    var distanceText:String{
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double


                var elevation: Range<Double>
                var pace: Range<Double>
                var heartRate: Range<Double>
    }
}


