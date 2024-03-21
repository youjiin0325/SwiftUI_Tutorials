//
//  ProfileHost.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/17/24.
//
//프로필이라는 새 그룹을 만든 다음 저장된 프로필의 사용자 이름을 표시하는 텍스트 보기와 함께 해당 그룹에 이름이 지정된 보기를 추가
//나중에 모델 데이터 프로필을 도입할 때까지 여기서 기본 프로필을 자리 표시자로 설정합니다 .draftProfile

import SwiftUI

struct ProfileHost: View {
    //@Environment이 뷰는 속성 래퍼가 포함된 속성을 사용하지 않더라도 이 뷰의 하위 항목은 사용합니다. 따라서 수정자가 없으면 미리보기가 실패합니다.ProfileSummary
    @Environment(\.editMode)  var editMode
    @Environment(ModelData.self) var modelData
    
   // 이 보기는 프로필 정보의 정적 요약 보기와 편집 모드를 모두 호스팅합니다.ProfileHost
    @State private var draftProfile = Profile.default
    
    var body: some View {
        //새로운 요약 보기를 표시
        VStack(alignment:.leading, spacing: 20){
            HStack{
                //제공하는 Done버튼 과 달리 버튼은 닫혀 있는 실제 프로필 데이터에 편집 내용을 적용하지 않습니다.EditButtonCancel
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                //환경 값을 켜거나 끄는 편집 버튼을 만듭니다.editMode
                Spacer()
                EditButton()
            }
            //실시간 미리보기 프로필모드 또는 프로필 편집 모드로 변경가능한 버튼
            if editMode?.wrappedValue == .inactive {
                //환경에서 사용자의 프로필 데이터를 읽어 데이터 제어권을 프로필 호스트에 전달
                ProfileSummary(profile:modelData.profile)
            }else {
                //에디터모드에서 수정하고 done을 누르면 업데이트
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                //에디터모드에서 수정하고 cancel 버튼 누르면 업데이트 적용X
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        }
            
        .padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
