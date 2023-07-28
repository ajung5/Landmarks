//
//  MapView.swift
//  Landmarks
//
//  Created by Agung Nawawi on 27/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // In MapView.swift, add a coordinate property to MapView and update the preview provider to pass a fixed coordinate.
    // This change also affects the build because the detail view has a map view that needs the new parameter. You’ll fix the detail view soon.
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    
    var body: some View {
        Map(coordinateRegion: $region)
            // Add an onAppear view modifier to the map that triggers a calculation of the region based on the current coordinate.
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    // Add a method that updates the region based on a coordinate value.
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
