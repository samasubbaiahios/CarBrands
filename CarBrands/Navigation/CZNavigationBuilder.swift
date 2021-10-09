//
//  CZNavigationBuilder.swift
//  CarBrands
//
//  Created by Venkata Sama on 09/10/21.
//

import UIKit

class NavigationBuilder {
    
    typealias buildNavigation = (UIViewController) -> UINavigationController
    
    /// Factory method for creating navigation controller.
    /// - Parameter viewController: Instance of root view controller.
    /// - Returns: Navigation controller.
    static func build(_ viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
