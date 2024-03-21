//
//  HikeView.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/15/24.
//

import SwiftUI

//수정자를 사용하여 뷰가 나타나고 사라질 때 다양한 전환을 제공합니다.asymmetric(insertion:removal:)
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    //호출을 함수 호출로 래핑합니다 .showDetail.toggle()withAnimation
                    //1.withANimation() 만 있을 때는 버튼이 커졋다 작아졌다 하는 애니메이션
                    //2.  withAnimation(.easeInOut(duration: 4)) 후에는 결과가 스르륵 나타났다가 사라짐
                    withAnimation{
                        showDetail.toggle()
                    }
                    
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .animation(nil, value: showDetail)// 애니메이션 수정자 제거
                        .scaleEffect(showDetail ? 1.5 : 1)// 버튼클릭하면 더 크게 만듬
                        .padding()
//                        .animation(.spring(), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
                  //  .transition(.slide)// 결과가 슬라이드로 나타남
                    
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
