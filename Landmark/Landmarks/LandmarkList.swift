import SwiftUI


struct LandmarkList: View {
    
    
    @Environment(ModelData.self) var modelData
    
    // @State - To observe change
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case mountains = "Mountains"
        case rivers = "Rivers"
    
        var id: FilterCategory { self }
    }


    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite) && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        
        return showFavoritesOnly ? "Favorites (\(title))" : title
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
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) {
                                category in Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "heart.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
}
