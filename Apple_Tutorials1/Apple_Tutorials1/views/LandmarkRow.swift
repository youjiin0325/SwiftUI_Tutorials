//
//  LandmarkRow.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landMark: LandMark
    
    
    var body: some View {
        Text(landMark.name)
    }
}

#Preview {
    LandmarkRow(landMark: landMarks[0])
}
