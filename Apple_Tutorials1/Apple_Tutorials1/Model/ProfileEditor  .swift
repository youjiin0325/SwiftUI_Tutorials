//
//  ProfileEditor  .swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/21/24.
//

import SwiftUI


struct ProfileEditor: View {
    //이름이 지정된 새 보기를 만들고 사용자 프로필의 초안 복사본에 대한 바인딩을 포함합니다.ProfileEditor
    @Binding var profile: Profile
    
    
    //시즌 선택기 아래에 를 추가하여 랜드마크 방문 목표 날짜를 수정할 수 있도록 합니다.DatePicker
    var dataRange:ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            //랜드마크 관련 이벤트에 대한 알림 수신에 대한 사용자 기본 설정에 해당하는 토글을 추가
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            //랜드마크 사진에 선호하는 계절을 선택할 수 있도록 Picker컨트롤과 해당 레이블을 에 배치
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                //enum 에 Season 모든 case를 가져오기 때문에 allCase
                ForEach(Profile.Season.allCases) {season in
                    Text(season.rawValue).tag(season)
                }
            }
           // 시즌 선택기 아래에 를 추가하여 랜드마크 방문 목표 날짜를 수정할 수 있도록 합니다.DatePicker
            DatePicker(selection: $profile.goalDate, in:dataRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
