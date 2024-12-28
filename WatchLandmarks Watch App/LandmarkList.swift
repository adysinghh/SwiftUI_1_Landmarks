import SwiftUI


struct LandmarkList: View {
    
    
    @Environment(ModelData.self) var modelData
    
    // @State - To observe change
    @State private var showFavoritesOnly = false


    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }


    var body: some View {
        //INSTEAD OF ABOVE METHOD WE CAN MAKE IT DYNAMIC
        
        // WE can add navigation capabilities in list by embedding it in a NaviagtionSplitview, then nesting each row in a NaviagtionLink to set up a transition to a desination view.
        NavigationSplitView {
            //Navigation link to make the list tappable to another view
            
            List {
                Toggle(isOn: $showFavoritesOnly)//$ prefix to access one of the properties of that var
                {
                    Text("Favorites only")
                }


                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
}
