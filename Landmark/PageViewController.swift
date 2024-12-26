//
//  PageViewController.swift
//  Landmark
//
//  Created by Aditya Singh on 03/12/24.
//

/***
 The page view controller stores an array of Page instances, which must be a type of View
 */

//import SwiftUI
//import UIKit

////THIS IS VIEWPAGER in android equivalent
///// The page view controller stores an array of Page instances , which must be of type view
///// These are the pages that we scroll between landmarks
//
//struct PageViewController<Page: View>: UIViewControllerRepresentable {
//    var pages: [Page]
//    
//    
//    //Method to PageViewController to make the coordinator.
//    ///SwiftUI calls this method before makeUIViewController, so that we have access to the coordinator object when configuring your view controller.
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    /// Adding the two requirements for the UIViewControllerRepresentable protocol
//    
//    
//    /// makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration.
//    func makeUIViewController(context: Context) -> UIPageViewController {
//        let pageViewController = UIPageViewController(
//            transitionStyle: .scroll,
//            navigationOrientation: .horizontal)
//        pageViewController.dataSource = context.coordinator
//
//
//        return pageViewController
//    }
//
//
//    
//    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
//        pageViewController.setViewControllers(
//            [context.coordinator.controllers[0]], direction: .forward, animated: true)
//    }
//    
//    
//    ///** SwiftUI view that represents a UIKit view controller can define a Coordinator type that SwiftUI manages and provides as part of the                          representable view’s context.
//    
//    /// nested Coordinator class inside PageViewController
//    /// manages your UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above.
//    class Coordinator: NSObject, UIPageControllerDataSource {
//        var parent: PageViewController
//        var controllers = [UIViewControllerType]()
//        
//        init(_ pageViewController: PageViewController) {
//            parent = pageViewController
//            controllers = parent.pages.map { UIHostingController(rootView: $0)}
//        }
//        
//        func pageViewController(
//            _ pageViewController: UIPageViewController,
//            viewControllerBefore viewController: UIViewControllerType) -> UIViewController?
//        {
//            guard let index = controllers.firstIndex(of: viewController) else {
//                return nil
//            }
//            
//            if index == 0 {
//                return controllers.last
//            }
//            return controllers[index - 1]
//        }
//        
//        func pageViewController(
//            _ pageViewController: UIPageViewController,
//            viewControllerAfter viewController: UIViewControllerType) -> UIViewController?
//        {
//            guard let index = controllers.firstIndex(of: viewController) else {
//                return nil
//            }
//            
//            if index + 1 == controllers.count {
//                return controllers.first
//            }
//            return controllers[index + 1]
//        }
//        
//    }
//}
import SwiftUI
import UIKit


struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var selectedPage: Int


    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }


    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator


        return pageViewController
    }


    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[selectedPage]], direction: .forward, animated: true)
        
    }


    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()


        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }


        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }


        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimation finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool)
        {
            if completed ,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = controllers.firstIndex(of: visibleViewController) {
                parent.selectedPage = index
            }
        }
    }
}
