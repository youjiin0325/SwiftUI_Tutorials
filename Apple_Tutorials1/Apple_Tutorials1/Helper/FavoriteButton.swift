//
//  FavoriteButton.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/12/24.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet : Bool //버튼의 현재 상태를 나타내는 바인딩을 추가
        
    var body: some View {
        
        //상태에 따라 모양을 변경
        Button{
            isSet.toggle()
        }
        label: {
            Label("Favourite", systemImage: isSet ? "star.fill" : "star" )
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
