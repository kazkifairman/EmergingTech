import SwiftUI

struct DAImmersiveView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Digital Assets")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Text("Choose a topic to explore:")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        NavigationLink(destination: BlockchainView()) {
                            VStack {
                                Image(systemName: "cube.box")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 10)
                                Text("Blockchain")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Learn the foundation of digital assets.")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .frame(width: 200, height: 220)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(20)
                        }

                        NavigationLink(destination: CryptocurrencyView()) {
                            VStack {
                                Image(systemName: "bitcoinsign.circle")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 10)
                                Text("Cryptocurrency")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Understand digital money and tokens.")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .frame(width: 200, height: 220)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(20)
                        }

                        NavigationLink(destination: CBDCsView()) {
                            VStack {
                                Image(systemName: "banknote")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 10)
                                Text("CBDCs")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("Central Bank Digital Currencies explained.")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .frame(width: 200, height: 220)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct BlockchainView: View {
    var body: some View {
        Text("Blockchain View")
    }
}

struct CryptocurrencyView: View {
    var body: some View {
        Text("Cryptocurrency View")
    }
}

struct CBDCsView: View {
    var body: some View {
        Text("CBDCs View")
    }
}

struct DAImmersiveView_Previews: PreviewProvider {
    static var previews: some View {
        DAImmersiveView()
    }
}
