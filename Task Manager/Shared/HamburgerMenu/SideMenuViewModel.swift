//
//  SideMenuViewModel.swift
//  Task Manager
//
//  Created by Anish on 7/14/22.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case support
    case policy
    
    var title: String {
        switch self {
        case .support: return "Contact Us"
        case .policy: return "Privacy Policy"
        }
    }
    
    var imageName: String {
        switch self {
        case .support: return "person"
        case .policy: return "shield.lefthalf.filled"
        }
    }
}
