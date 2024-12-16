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
    
    
}
