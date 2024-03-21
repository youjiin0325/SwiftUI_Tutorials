//
//  ProfileSummary.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/17/24.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData// 하이킹 데이터를 사용하려면 모델 데이터 환경 속성도 추가해야 합니다.
    var profile : Profile
    
    var body: some View {
        //인스턴스 를 가져와 몇 가지 기본 사용자 정보를 표시하는 Profiles 그룹에 또 다른 보기를 만듭
        ScrollView{
            VStack(alignment:.leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date:") + Text(profile.goalDate, style: .date)
                
                // Text("Goal Date:").bold() + Text(profile.goalDate, style: .date) => 나란히 있는 문자들중 특정문자만 스타일 변경하는 법!!
                
                Divider()
                
                VStack(alignment:.leading){
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView{
                        HStack{
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees:90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)// 회색으로 색 변경..
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment:.leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
}
