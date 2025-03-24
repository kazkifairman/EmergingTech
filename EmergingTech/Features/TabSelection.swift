//
//  TabSelection.swift
//  EmergingTechApp
//
//  Created by Innovation Showroom on 20/03/2025.
//

import SwiftUI
import RealityKit
import RealityKitContent


// keep this to change the tabs later

struct TabSelection: View {
    var body: some View {
        TabView {
            AISection()
                .tabItem {
                    Label("AI", systemImage: "brain.head.profile")
                }
            
            QuantumSection()
                .tabItem {
                    Label("Quantum", systemImage: "atom")
                }
            
            DigitalAssetsSection()
                .tabItem {
                    Label("Digital Assets", systemImage: "bitcoinsign.circle")
                }
        }
    }
}

#Preview(windowStyle: .automatic) {
    TabSelection()
        .environment(AppModel())
}
