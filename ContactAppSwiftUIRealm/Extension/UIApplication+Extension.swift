//
//  UIApplication+Extension.swift
//  ContactAppSwiftUIRealm
//
//  Created by Yogesh Rathore on 14/01/25.
//

import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        
        // Get Connected scene
        return UIApplication.shared.connectedScenes
        // Keep only active scene, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive}
        // Keep Only the first UIWindowScene
            .first(where: { $0 is UIWindowScene})
        // Get its associated windows
            .flatMap( { $0 as? UIWindowScene})?.windows
        // Finally keep only the key window
            .first(where: \.isKeyWindow)
    }
}
