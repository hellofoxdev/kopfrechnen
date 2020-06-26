/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    
    @Published var isConfigurationValid: Bool = false
    @Published var comma: Bool = false
    @Published var negative: Bool = false
    
    @Published var pageIndex: PageIndex = .main
    @Published var showMenu: Bool = false
    @Published var showLittleOnce: Bool = false
    @Published var showGirls: Bool = false
    @Published var showVersion: Bool = false
    
    @Published var littleOnceOffsetX: CGFloat = -UIScreen.main.bounds.width
    @Published var littleOnceOffsetY: CGFloat = UIScreen.main.bounds.height
    
    @Published var versionOffsetX: CGFloat = -UIScreen.main.bounds.width
    @Published var versionOffsetY: CGFloat = UIScreen.main.bounds.height
    
    @Published var girlsOffsetX: CGFloat = UIScreen.main.bounds.width
    @Published var girlsOffsetY: CGFloat = UIScreen.main.bounds.height
    
    @Published var menuOffsetY: CGFloat = UIScreen.main.bounds.height
    @Published var menuOffsetX: CGFloat = -UIScreen.main.bounds.width
    
    @Published var isButtonDisabled: Bool = true
    
    @Published var appVersion: Float = 0.0
    @Published var labelTextVersion: Float = 0.0
    
    @Published var calcTasks: [Task] = []
    
    @Published var design: String = UserDefaults.standard.string(forKey: "design") ?? "blackboard" {
        didSet {
            UserDefaults.standard.set(self.design, forKey: "design")
        }
    }
    
    @Published var didSelectDesign: Bool = UserDefaults.standard.bool(forKey: "didSelectDesign") {
        didSet {
            UserDefaults.standard.set(self.didSelectDesign, forKey: "didSelectDesign")
        }
    }
    
//    @Published var profile: Profile.default
}
