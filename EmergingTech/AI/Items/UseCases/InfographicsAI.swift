//
//  InfographicsAI.swift
//  EmergingTech
//
//  Created by Innovation Showroom on 24/03/2025.
//

import SwiftUI

struct InfographicsAI: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("💸 AI in Financial Services")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)

                VStack(alignment: .leading, spacing: 15) {
                    Text("📊 Fraud Detection")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        AI models analyze large volumes of transaction data to identify suspicious activity. Machine learning algorithms detect \
                        anomalies and flag potential fraud in real-time, helping financial institutions reduce losses.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("📈 Algorithmic Trading")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        AI-powered trading systems use predictive analytics to identify trading opportunities. These algorithms make split-second \
                        decisions based on market data, maximizing profits and minimizing risks.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("🤖 Personalized Banking")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        AI chatbots and virtual assistants provide personalized customer support and financial advice. They analyze user preferences \
                        and offer tailored recommendations, improving the customer experience.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)

                    Text("🧠 Risk Management")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(.top, 10)

                    Text("""
                        AI models assess credit risk and predict loan defaults by analyzing historical data. This helps financial institutions make \
                        more informed lending decisions and mitigate risks.
                        """)
                        .font(.body)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()

                NavigationLink(destination: AIFinancial3DView()) {
                    Text("🔍 Explore AI in Finance in 3D")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
        .navigationTitle("AI Infographics")
    }
}


