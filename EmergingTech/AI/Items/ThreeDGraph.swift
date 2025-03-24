//
//  ThreeDGraph.swift
//  EmergingTechApp
//
//  Created by Innovation Showroom on 20/03/2025.
//


import SwiftUI
import RealityKit

struct ThreeDGraph: View {
    @State private var translationY: Double = 0
    @State private var gradientX: Double = 0
    @State private var gradientZ: Double = 0
    //@State private var xVector = simd_normalize(SIMD3(1, gradientX, 0))
    //@State private var zVector = simd_normalize(SIMD3(0, gradientZ, 1))
    //@State private var resultantAxis = SIMD3<Float>(-simd_normalize(xVector + zVector))
    @State private var rotationAngle: CGFloat = 0.3 // Rotation angle in radians
    @State private var rotationAxisX: CGFloat = 0.0 // X-axis component
    @State private var rotationAxisY: CGFloat = 0.0 // Y-axis component
    @State private var rotationAxisZ: CGFloat = 0.0 // Z-axis component
    
    @State private var planeEntity: ModelEntity? = nil
    @State private var planeEntityR: ModelEntity? = nil
    
    var meshLarge = MeshResource.generateSphere(radius: 0.011)
    var meshSmall = MeshResource.generateSphere(radius: 0.005)
    
    // User's modifiable function
    func f(x: Float, z: Float) -> Float {
        return Float(gradientX) * x + Float(gradientZ) * z + Float(translationY)
    }
    
    @State private var randomGradientX = Float.random(in: -2...2)
    @State private var randomGradientZ = Float.random(in: -2...2)
    @State private var randomTranslationY = Float.random(in: -0.1...0.1)
    
    // Target function to match
    func g(x: Float, z: Float) -> Float {
        return Float(randomGradientX) * x + Float(randomGradientZ) * z + randomTranslationY
    }
    
    
    var redMaterial = UnlitMaterial(color: .init(.red))
    var greenMaterial = UnlitMaterial(color: .init(.green))
    
    @State private var points: [(SIMD3<Float>, Bool, ModelEntity)] = [
    ]
    
    @State private var basisVectors: [String: ModelEntity] = [
        "X": ModelEntity(),
        "Z": ModelEntity()
    ]
    
    var body: some View {
        VStack {
            
            RealityView { content in
                // Create a 3D point
                //let sphere = ModelEntity(mesh: .generateSphere(radius: 0.01))
                //sphere.position = SIMD3(0.0, 0.0, 0.0) // x, y, z coordinates
                
                let pointCount = 500
                
                for _ in 0...pointCount {
                    let randomX = Float.random(in: -0.4...0.4)
                    let randomY = Float.random(in: -0.2...0.2)
                    let randomZ = Float.random(in: -0.2...0.2)
                    
                    let confidence = g(x: randomX, z: randomZ) - randomY
                    
                    // Filter points too close to the true boundary
                    if abs(confidence) > 0.12 {
                        let newTuple = (SIMD3(randomX, randomY, randomZ), true, ModelEntity(mesh: meshLarge))
                        points.append(newTuple)
                    }
                    
                }
                
                for point in points {
                    
                    let modelEntity = point.2
                    modelEntity.position = point.0
                    
                    if f(x: modelEntity.position.x, z: modelEntity.position.z) < modelEntity.position.y {
                        modelEntity.model?.mesh = meshLarge
                    } else {
                        modelEntity.model?.mesh = meshSmall
                    }
                    
                    let confidence = g(x: modelEntity.position.x, z: modelEntity.position.z) - modelEntity.position.y
                    
                    if confidence < 0 {
                        modelEntity.model?.materials = [greenMaterial]
                    } else {
                        modelEntity.model?.materials = [redMaterial]
                    }
                    
                    content.add(modelEntity)
                    
                }
                
                // Add the sphere to the scene
                //content.add(sphere)
                
                // Create a 3D line (a thin box for simplicity)
                let r: Float = 0.003
                let l: Float = 1.0
                let lines = [
                    ModelEntity(mesh: .generateBox(size: [l, r, r])),
                    ModelEntity(mesh: .generateBox(size: [r, l, r])),
                    ModelEntity(mesh: .generateBox(size: [r, r, l]))
                ]
                for line in lines {
                    line.position = SIMD3(0.0, 0.0, 0.0)
                    line.model?.materials = [SimpleMaterial(color: .blue, isMetallic: false)]
                    content.add(line)
                }
                //line.position = SIMD3(0.00, 0.0, 0.0) // center of the line
                //content.add(line)
                
                let basisX = ModelEntity(mesh: .generateBox(size: [l, r, r]))
                let basisZ = ModelEntity(mesh: .generateBox(size: [r, r, l]))
                content.add(basisX)
                content.add(basisZ)
                basisX.position = SIMD3(0.0, 0.0, 0.0)
                basisX.model?.materials = [SimpleMaterial(color: .red, isMetallic: false)]
                basisZ.position = SIMD3(0.0, 0.0, 0.0)
                basisZ.model?.materials = [SimpleMaterial(color: .red, isMetallic: false)]
                basisVectors["X"] = basisX
                basisVectors["Z"] = basisZ
                
                if planeEntity == nil {
                    let plane = ModelEntity(mesh: .generatePlane(width: 4, depth: 4))
                    let planeR = ModelEntity(mesh: .generatePlane(width: 4, depth: 4))
                    
                    plane.position = SIMD3(0, 0, 0) // Position the plane at the origin
                    planeR.position = SIMD3(0, 0, 0)
                    
                    let material = SimpleMaterial(color: .init(white:1.0, alpha: 0.5), isMetallic: false)
                    
                    plane.model?.materials = [material]
                    planeR.model?.materials = [material]
                    
                    planeEntity = plane
                    planeEntityR = planeR
                    content.add(plane)
                    content.add(planeR)
                }
                
                
                let quaternion = simd_quatf(angle: Float(gradientX), axis: SIMD3(Float(gradientX), Float(rotationAxisY), Float(rotationAxisZ)))
                
                
            }
            .ignoresSafeArea()
            
            HStack {
                VStack {
                    Slider(value: $gradientX, in: -3...3, step: 0.01)
                        .padding()
                        .accentColor(.blue)
                        .onChange(of: gradientX) { _ in updatePlaneRotation() }
                    Text("Gradient X: \((gradientX))")
                        .font(.headline)
                        .padding(.top)
                }
                VStack {
                    Slider(value: $gradientZ, in: -3...3, step: 0.01)
                        .padding()
                        .accentColor(.blue)
                        .onChange(of: gradientZ) { _ in updatePlaneRotation() }
                    Text("Gradient Z: \((gradientZ))")
                        .font(.headline)
                        .padding(.top)
                }
                VStack {
                    Slider(value: $translationY, in: -1...1, step: 0.001)
                        .padding()
                        .accentColor(.blue)
                        .onChange(of: translationY) { _ in updatePlaneTranslation() }
                    Text("Bias: \((translationY))")
                        .font(.headline)
                        .padding(.top)
                }
            }
            HStack {
                Text(stringBuilder()).font(.system(size: 70, weight: .regular, design: .serif)) // Serif design for a mathematical look
                    .italic() // Adds an italic style for a mathematical feel
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(30)
                
                Text("Accuracy: " + String(format: "%.2f", accuracy())).font(.system(size: 70, weight: .regular, design: .serif)) // Serif design for a mathematical look
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(30)
            }

        }
    }
    
    func stringBuilder() -> String {
        var formattedString = " y = "
        if gradientX < 0 {
            formattedString += "-"
        }
        formattedString += String(format: "%.2f", abs(gradientX)) + "x "
        
        if gradientZ < 0 {
            formattedString += "- "
        } else {
            formattedString += "+ "
        }
        formattedString += String(format: "%.2f", abs(gradientZ)) + "z "
        
        if translationY < 0 {
            formattedString += "- "
        } else {
            formattedString += "+ "
        }
        formattedString += String(format: "%.2f", abs(translationY))
        
        return formattedString
    }
    
    func sign(x: Float) -> Int {
        if x > 0 {
            return 1
        } else {
            return -1
        }
    }
    
    func accuracy() -> Double {
        let total = Double(points.count)
        var correct = 0.0
        for point in points {
            
            let modelEntity = point.2
            
            let f_value = f(x: modelEntity.position.x, z: modelEntity.position.z)
            let g_value = g(x: modelEntity.position.x, z: modelEntity.position.z)
            
            let f_sign = sign(x: f_value)
            let g_sign = sign(x: g_value)
            
            // If the point is on the same side of both planes, it is correctly classified
            if (f_sign == g_sign) {
                correct += 1.0
            }
        }
        
        return correct / total
    }
    
    func updatePlaneRotation() {
        guard let plane = planeEntity else { return }
        guard let planeR = planeEntityR else { return }
    
        
        let squaredSum = gradientX * gradientX + gradientZ * gradientZ
        let magnitude = sqrt(squaredSum)
        let pitch = atan(squaredSum / magnitude)
        let normalizedAxisVector = magnitude > 0 ? SIMD3<Float>(-Float(gradientZ) / Float(magnitude), 0, Float(gradientX) / Float(magnitude)) : SIMD3<Float>(0.0, 0.0, 0.0)
        let rotation = simd_quatf(angle: Float(pitch), axis: normalizedAxisVector)
        let rotationR = simd_quatf(angle: Float(pitch) + Float(Double.pi), axis: normalizedAxisVector)
        
        //plane.transform.rotation = rotationZ * rotationX
        
        plane.transform.rotation = rotation
        planeR.transform.rotation = rotationR
        
        updatePoints()
        updateBasisVectors()
    }
    
    func updatePlaneTranslation() {
        guard let plane = planeEntity else { return }
        guard let planeR = planeEntityR else { return }
        
        var currentPosition = plane.transform.translation
        
        currentPosition.y = Float(translationY)
        
        plane.transform.translation = currentPosition
        planeR.transform.translation = currentPosition
        basisVectors["X"]?.transform.translation = currentPosition
        basisVectors["Z"]?.transform.translation = currentPosition
        
        updatePoints()
        updateBasisVectors()
        
    }
    
    func updatePoints() {
        for point in points {
            
            let modelEntity = point.2
            
            if f(x: modelEntity.position.x, z: modelEntity.position.z) < modelEntity.position.y {
                modelEntity.model?.mesh = meshLarge
            } else {
                modelEntity.model?.mesh = meshSmall
            }
            
        }
    }
    
    func updateBasisVectors() {
        
        let angleX = atan(gradientX)
        let angleZ = atan(gradientZ)
        
        // Vectors here are switched as they are axis rotations.
        let rotationX = simd_quatf(angle: Float(angleX), axis: SIMD3<Float>(0, 0, 1)).normalized
        let rotationZ = simd_quatf(angle: Float(-angleZ), axis: SIMD3<Float>(1, 0, 0)).normalized
        
        basisVectors["X"]?.transform.rotation = rotationX
        basisVectors["Z"]?.transform.rotation = rotationZ

    }
}

#Preview() {
    ThreeDGraph()
}