//
//  PageViewController.swift
//  Landmarks
//
//  Created by Agung Nawawi on 31/07/23.
//


// Create a PageView group in your project’s Views folder, and add a new Swift file named PageViewController.swift; Declare the PageViewController type as conforming to UIViewControllerRepresentable.
// The page view controller stores an array of Page instances, which must be a type of View. These are the pages you use to scroll between landmarks.

import SwiftUI
import UIKit


struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    // Add another method to PageViewController to make the coordinator.
    // SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller.
    // tip
    // You can use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.
    func makeCoordinator() -> Coordinator {
        Coordinator(pageViewController: self)
       }

    // Add a makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration.
    // SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        // Add the coordinator as the data source of the UIPageViewController.
        pageViewController.dataSource = context.coordinator

        return pageViewController
    }


    // Add an updateUIViewController(_:context:) method that calls setViewControllers(_:direction:animated:) to provide a view controller for display.
    // For now, you create the UIHostingController that hosts the page SwiftUI view on every update. Later, you’ll make this more efficient by initializing the controller only once for the life of the page view controller.
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            // [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
            
            // Initialize an array of controllers in the coordinator using the pages array of views.
            // The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller.
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    // Declare a nested Coordinator class inside PageViewController.
    // SwiftUI manages your UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above.
    
    // Add UIPageViewControllerDataSource conformance to the Coordinator type, and implement the two required methods.
    // These two methods establish the relationships between view controllers, so that you can swipe back and forth between them.
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init( pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map {UIHostingController(rootView: $0)}
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
    }
}
