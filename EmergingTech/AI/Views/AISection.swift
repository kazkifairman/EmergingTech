//
//  AISection.swift
//  EmergingTechApp
//
//  Created by Innovation Showroom on 20/03/2025.
//

import SwiftUI

struct AISection: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AIImmersiveView().edgesIgnoringSafeArea(.all)) {
                Text("Artificial Intelligence")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
