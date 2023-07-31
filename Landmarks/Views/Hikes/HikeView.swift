/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

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
                    // Wrap the call to showDetail.toggle() with a call to the withAnimation function.
                    // Both of the views affected by the showDetail property — the disclosure button and the HikeDetail view — now have animated transitions.
                    /* withAnimation (.easeInOut(duration: 4)){ // Pass a four-second long basic animation to the withAnimation function.
                        showDetail.toggle()
                    } */
                    
                    // Before continuing to the next section, restore the withAnimation function to use the default animation by removing the call’s input parameter.
                    withAnimation {
                        showDetail.toggle()
                    }
                    
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //  Try turning off animation for the rotation by adding another animation modifier just above the scaleEffect modifier.
                        // Take SwiftUI for a spin. Try combining different animation effects to see what’s possible.
                        // .animation(nil, value: showDetail)
                    
                        // Add another animatable change by making the button larger when the graph is visible.
                        // The animation modifier applies to all animatable changes within the views it wraps.
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                    
                        // turn on animation for the button’s rotation by adding an animation modifier that begins on changes of the showDetail value.
                        // .animation(.easeInOut, value: showDetail)
                    
                        // Change the animation type from easeInOut to spring().
                        // SwiftUI includes basic animations with predefined or custom easing, as well as spring and fluid animations. You can adjust an animation’s speed, set a delay before an animation starts, or specify that an animation repeats.
                        // .animation(.spring(), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
