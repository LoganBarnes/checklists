//
//  AirframeImage.swift
//  Checklists
//
//  Created by Logan Barnes on 12/16/23.
//

import SwiftUI

struct AirframeImage: View {
    var image: Image
    
    var body: some View {
        image.resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .scaledToFit()
    }
}

#Preview {
    AirframeImage(image: Image("R22"))
}
