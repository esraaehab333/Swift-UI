//
//  MyMap.swift
//  Lab1
//
//  Created by Nemo on 31/05/2026.
//

import SwiftUI
import MapKit

struct MyMap: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    var body: some View {
        Map(coordinateRegion: $region).ignoresSafeArea()
    }
}

struct MyMap_Previews: PreviewProvider {
    static var previews: some View {
        MyMap()
    }
}

