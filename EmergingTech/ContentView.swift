//
//  ContentView.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 24/03/2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
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
    ContentView()
        .environment(AppModel())
}
