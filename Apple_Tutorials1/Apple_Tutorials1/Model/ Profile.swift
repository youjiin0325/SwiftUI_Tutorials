//
//   Profile.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/17/24.
//

import Foundation

struct  Profile {
    var username: String
    var prefersNotifications = true // 예약어를 변수명으로 쓰고 싶을 때 prefersNotifications
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season:String, CaseIterable,Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id:String {rawValue}
    }
}
