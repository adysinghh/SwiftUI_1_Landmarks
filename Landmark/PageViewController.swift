//
//  PageViewController.swift
//  Landmark
//
//  Created by Aditya Singh on 03/12/24.
//

import SwiftUI
import UIKit

/***
 The page view controller stores an array of Page instances, which must be a type of View
 */
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    //SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        return pageViewController
    }
    
    // UIHostingController that hosts the page SwiftUI view on every update
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])],
            direction: .forward, animated: true
        )
    }
}
