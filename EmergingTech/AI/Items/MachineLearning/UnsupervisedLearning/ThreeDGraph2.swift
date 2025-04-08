
//
//  ThreeDGraph.swift
//  EmergingTechApp
//
//  Created by Innovation Showroom on 20/03/2025.
//

import SwiftUI
import RealityKit
import Foundation

struct ThreeDGraph2: View {
    
    var meshLarge = MeshResource.generateSphere(radius: 0.011)
    var meshSmall = MeshResource.generateSphere(radius: 0.005)

    var redMaterial = UnlitMaterial(color: .init(.red))
    var greenMaterial = UnlitMaterial(color: .init(.green))
    
    @State private var points: [[(SIMD3<Float>, Int, ModelEntity)]] = []
    @State private var centroids: [(SIMD3<Float>, Int, ModelEntity)] = []
    
    var clusters = 8
    var pointsPerCluster = 25
    
    var body: some View {
        VStack {
            
            RealityView { content in
                
                // For each cluster:
                // Initialise centroid location, and cluster location
                // For each point around cluster, normally distribute in 3 dimensions
                    
                var cluster_positions: [SIMD3<Float>] = []
                
                for i in 0...clusters {

                    let centroid_position: SIMD3<Float> = [
                        Float.random(in: -0.4...0.4),
                        Float.random(in: -0.4...0.4),
                        Float.random(in: -0.4...0.4)
                    ]
                    
                    var cluster_position: SIMD3<Float> = [
                        Float.random(in: -0.4...0.4),
                        Float.random(in: -0.4...0.4),
                        Float.random(in: -0.4...0.4)
                    ]
                    // Re-initialise point if it's too close to the rest.
                    while tooClose(minimumSeparation: 0.01, candidatePoint: cluster_position, otherPoints: cluster_positions) {
                        cluster_position = [
                            Float.random(in: -0.4...0.4),
                            Float.random(in: -0.4...0.4),
                            Float.random(in: -0.4...0.4)
                        ]
                    }
                    
                    centroids.append((
                        centroid_position,
                        i,
                        ModelEntity(mesh: meshSmall, materials: [greenMaterial])
                    ))
                    cluster_positions.append(cluster_position)
                    
                    var cluster_points: [(SIMD3<Float>, Int, ModelEntity)] = []
                    
                    for ii in 0...pointsPerCluster {
                        
                        let point_offset: SIMD3<Float> = [
                            randomNormal(),
                            randomNormal(),
                            randomNormal()
                        ]
                        
                        cluster_points.append((
                            centroid_position + point_offset,
                            i,
                            ModelEntity(mesh: meshSmall, materials: [redMaterial])
                        ))
                        
                    }
                    
                    points.append(cluster_points)
                }
                        
                
                print(points)
                
                for centroid in centroids {
                    let modelEntity = point.2
                    modelEntity.position = point.0
                    
                    //modelEntity.model?.mesh = meshSmall
                    
                    //modelEntity.model?.materials = [redMaterial]
                    content.add(modelEntity)
                }
                // Add the sphere to the scene
                //content.add(sphere)
                
                // Create a 3D line (a thin box for simplicity)
                /*let r: Float = 0.003
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
                */
                
            }
            .ignoresSafeArea()
            
            

        }
    }
    
    
    func sign(x: Float) -> Int {
        if x > 0 {
            return 1
        } else {
            return -1
        }
    }
    
    func tooClose( minimumSeparation: Float, candidatePoint: SIMD3<Float>, otherPoints: [SIMD3<Float>]) -> Bool {
        for otherPoint in otherPoints {
            if simd_distance(otherPoint, candidatePoint) < minimumSeparation {
                return true
            }
        }
        return false
    }
    
    func randomNormal(mean: Double = 0.0, standardDeviation: Double = 1.0) -> Float {
        // Box-Muller Transform.
        let u1 = Double.random(in: 0..<1)
        let u2 = Double.random(in: 0..<1)
        let z0 = sqrt(-2.0 * log(u1)) * cos(2.0 * .pi * u2)
        return Float(z0 * standardDeviation + mean)
    }
    

}

#Preview() {
    ThreeDGraph()
}
