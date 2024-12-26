//
//  PageControl.swift
//  Landmark
//
//  Created by Aditya Singh on 26/12/24.
//

import SwiftUI

/// UIViewRepresentable and UIViewControllerRepresentable types have the same life cycle, with methods that correspond to their underlying UIKit types
import UIKit

struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var selectedPage: Int
    
    ///
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        /// Add the coordinator as the target for the valueChanged event, specifying the update CurrentPage(sender:) method as the action to perform
        control.addTarget(
                          context.coordinator,
                          action: #selector(Coordinator.updateCurrentPage(sender:)),
                          for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = numberOfPages
    }
    
    // Create a nested Coordinator type in PageControl, and add a make Coordinator() method to create and return a new coordinator
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.selectedPage = sender.currentPage
        }
    }
}
