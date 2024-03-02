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
        
        HStack {
            landMark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landMark.name)
            
            Spacer()
        }
    }
}
//Give each preview a name to help distinguish between them.
//Remove the second preview, and instead wrap the two versions of the row in a Group.

#Preview ("Turtle Rock"){
    Group{
        LandmarkRow(landMark: landMarks[0])
        LandmarkRow(landMark: landMarks[1])
    }
}

