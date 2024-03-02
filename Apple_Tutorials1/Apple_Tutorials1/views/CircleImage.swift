//
//  CircoleImage.swift
//  Apple_Tutorials1
//
//  Created by 유지인 on 3/1/24.
//

import SwiftUI

struct CircleImage: View {
    
    //In the CircleImage file, add a stored image property to the CircleImage structure.
    
    var image: Image
    
    var body: some View {
       image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
