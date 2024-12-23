import Foundation
import SwiftUI
import CoreLocation

// Identifiable -> for adding id's in list
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, Codable, CaseIterable {
        case lakes = "Lakes"
        case mountains = "Mountains"
        case rivers = "Rivers"
    }

    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //Computed property to the Landmark structure that returns the feature image, if it exists.
    var featureImage: Image? {
            isFeatured ? Image(imageName + "_feature") : nil
    }


    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }


    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
