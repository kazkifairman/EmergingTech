//
//  QuantumImmersiveView.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 09/04/2025.
//

import SwiftUI

struct QuantumImmersiveView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Quantum Computing")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Text("Choose a topic to explore:")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        NavigationLink(destination: SuperpositionView()) {
                            VStack {
                                Image(systemName: "waveform.path")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 10)
                                Text("Superposition")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Learn how particles can be in multiple states at once.")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .frame(width: 200, height: 220)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(20)
                        }

                        NavigationLink(destination: EntanglementView()) {
                            VStack {
                                Image(systemName: "link")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 10)
                                Text("Entanglement")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Discover how particles are linked across space.")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .frame(width: 200, height: 220)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(20)
                        }

                        NavigationLink(destination: QubitsView()) {
                            VStack {
                                Image(systemName: "circle.hexagongrid")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 10)
                                Text("Qubits")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Understand the basic unit of quantum information.")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .frame(width: 200, height: 220)
                            .background(Color.indigo.opacity(0.1))
                            .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 300)
                Spacer()
            }
            .padding()
        }
    }
}


struct SuperpositionView: View {
    var body: some View {
        Text("Superposition View")
    }
}

struct EntanglementView: View {
    var body: some View {
        Text("Entanglement View")
    }
}

struct QubitsView: View {
    var body: some View {
        Text("Qubits View")
    }
}
