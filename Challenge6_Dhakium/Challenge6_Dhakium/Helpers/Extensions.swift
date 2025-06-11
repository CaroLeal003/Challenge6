//
//  Extensions.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 11/06/25.
//

import Foundation
import UIKit

extension UIDevice {
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}

