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
    
    // Declare the @State variable in PageView, and pass a binding to the property when creating the child PageViewController.
    // important
    // Remember to use the $ syntax to create a binding to a value that is stored as state.
    @State private var currentPage = 0
    
    var body: some View {
        // Replace the text box with the page control, switching from a VStack to a ZStack for layout.
        // Because you’re passing the page count and the binding to the current page, the page control is already showing the correct values.
        ZStack (alignment: .bottomTrailing){
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
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
