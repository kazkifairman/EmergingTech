//
//  StartupView.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 09/04/2025.
//

import SwiftUI

struct StartupView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            HStack(spacing: 40) {
                VStack {
                    Image(systemName: "brain.head.profile")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                    Text("AI")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .rotation3DEffect(.degrees(30), axis: (x: 0, y: 1, z: 0))

                VStack {
                    Image(systemName: "atom")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.purple)
                    Text("Quantum")
                        .font(.title)
                        .foregroundColor(.white)
                }

                VStack {
                    Image(systemName: "bitcoinsign.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.orange)
                    Text("Digital Assets")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .rotation3DEffect(.degrees(-30), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
}
