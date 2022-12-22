//
//  Extensions.swift
//  loginScreen
//
//  Created by Nikita Alpatiev on 12/21/22.
//

import UIKit

extension UIViewController {
    
    /// Creates view with attached UIImage if this image exists. Scale represents view's size and must be between 0 and 1. By default image is centered and not resized.
    func viewWithAttachedImage(withSize: CGSize, scale: CGFloat, imageNamed: String) -> UIView {
        let rectangle = UIView(frame: CGRect(x: 0, y: 0,
                                             width: withSize.width,
                                             height: withSize.height))
        
        let inset = 0...1 ~= scale ? scale: 1
        let edge = withSize.width < withSize.height ? withSize.width: withSize.height
        
        if let image = UIImage(named: imageNamed) {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0,
                                                      width: edge * inset,
                                                      height: edge * inset))
            imageView.image = image
            imageView.center = rectangle.center
            rectangle.addSubview(imageView)
        }
        
        return rectangle
    }
}

extension UIView {
    
    // Creates black shadow with selected corner radius to element
    func createShadowLayer(withCornerradius: CGFloat, opacity: Float = 0.5) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = withCornerradius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

