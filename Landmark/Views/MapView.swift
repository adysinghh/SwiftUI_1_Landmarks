import SwiftUI
import MapKit


struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case far = "Far"
        case medium = "Medium"
        
        var id: Zoom {
            return self
        }
    }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .far: return 0.2
        case .medium: return 2
        }
    }
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    // This adds MapView which is in MapKit
    private var region: MKCoordinateRegion {
        MKCoordinateRegion (
            center: coordinate ,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}



#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
