//
//  LandmarkList.swift
//  SwiftUISample
//
//  Created by Mine on 5.12.2020.
//

import SwiftUI
import StoreKit

struct LandmarkList: View {
   
    #if APPCLIP
    let title = "Welcome Clip"
    #else
    let title = "Landmarks"
    #endif
    
    var body: some View {
        NavigationView {
            List(landmarkData, id: \.id) { landmark in
                #if !APPCLIP
                NavigationLink(destination: DetailView(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
                #else
                LandmarkRow(landmark: landmark)
                #endif
            }
            .navigationBarTitle(title)
        }
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
