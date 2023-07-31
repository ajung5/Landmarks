//
//  PageView.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//

import SwiftUI

// update the PageView type to declare PageViewController as a child view.
struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        // The preview fails because Xcode can’t infer a type for Page.
        // PageView()
        
        
        // Update the preview provider to pass the required array of views, and the preview starts working.
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0)})
            .aspectRatio(3/2, contentMode: .fit)
    }
}
