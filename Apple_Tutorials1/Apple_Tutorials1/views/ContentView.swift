//
//  ContentView.swift
//  Apple_Tutorials1: Creating and combining views
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    //탭 선택을 위한 상태 변수를 추가하고 기본값을 지정
    @State private var selectedTap :Tab = .featured
    //사용자가 방금 만든 카테고리 보기와 기존 랜드마크 목록 중에서 선택할 수 있는 탭 보기를 표시하도록 앱의 기본 콘텐츠 보기를 수정
    enum Tab {
        case featured
        case list
        
    }
    
    
    var body: some View {
        
        // 래핑하는 탬보기를 만들고,  enum Tab의 케이스에 따라서 값이 달라짐
        //tag(_:)각 보기의 수정자는 속성이 취할 수 있는 가능한 값 중 하나와 일치 하므로 selection사용자 가 사용자 인터페이스에서 선택할 때 표시할 보기를 조정할 수 있습니다.TabView
        TabView(selection: $selectedTap){
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}
//Update the ContentView preview to add the model object to the environment, which makes the object available to any subview.

//A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environment(_:) modifier.
#Preview {
    ContentView().environment(ModelData())
}
