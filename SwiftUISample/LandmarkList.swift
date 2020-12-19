//
//  LandmarkList.swift
//  SwiftUISample
//
//  Created by Mine on 5.12.2020.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarkData, id: \.id) { landmark in
                NavigationLink(destination: DetailView(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle("Landmarks")
        }
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
