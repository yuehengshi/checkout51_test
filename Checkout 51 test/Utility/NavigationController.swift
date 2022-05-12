//
//  NavigationController.swift
//  Checkout 51 test
//
//  Created by yuehengshi on 2022-05-11.
//

import Foundation
import UIKit
extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }

    func setTintColor(_ color: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        self.navigationBar.tintColor = color
    }

    func backgroundColor(_ color: UIColor) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.barTintColor = color
        navigationBar.shadowImage = UIImage()
    }
    
}

extension UIViewController {
    
    func setRightBarButtonItem(_ img: UIImage, _ selector: Selector?){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: selector)
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
}
