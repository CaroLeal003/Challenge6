//
//  OnboardingManager.swift
//  Challenge6_Dhakium
//
//  Created by Cristofor Doamre on 06/06/25.
//

import Foundation

class OnboardingManager {
    private let onboardingKey = "hasSeenOnboarding"

    static let shared = OnboardingManager() // Singleton

    private init() {}

    
    func setOnboardingSeen() {
        UserDefaults.standard.set(true, forKey: onboardingKey)
    }

    func shouldShowOnboarding() -> Bool {
        return UserDefaults.standard.bool(forKey: onboardingKey)
    }
}
