//
//  PageViewController.swift
//  Landmark
//
//  Created by Aditya Singh on 16/12/24.
//

import Foundation
import SwiftUI
import UIKit

//THIS IS VIEWPAGER in android equivalent
/// The page view controller stores an array of Page instances , which must be of type view
/// These are the pages that we scroll between landmarks
public struct PageViewController<PAGE: View>: UIViewControllerRepresentable {
    var pages: [PAGE]
    
    /// Adding the two requirements for the UIViewControllerRepresentable protocol
    
    
    /// makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration.
    public func makeUIViewController(context: Context) -> UIViewController {
        let pageViewController = UIPageViewController(
            trasitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        return pageViewController
    }
    
    /// Adding an updateUIViewController(_:context:) method that calls setViewControllers(_:direction:animated:) to provide a view controller for display.
    /// Creates the UIHostingController that hosts the page SwiftUI view on every update.
    public func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
    
    
    
}
