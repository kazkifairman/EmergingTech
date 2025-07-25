
//
//  ThreeDGraph.swift
//  EmergingTechApp
//
//  Created by Innovation Showroom on 20/03/2025.
//

// CLUSTER means the collection of points.
// CENTROID means the point which the algorithm thinks where the cluster is during runtime.

import SwiftUI
import RealityKit
import Foundation
import simd

struct KMeans: View {
    
    var meshLarge = MeshResource.generateSphere(radius: 0.011)
    var meshSmall = MeshResource.generateSphere(radius: 0.002)

    var redMaterial = UnlitMaterial(color: .init(.red))
    var greenMaterial = UnlitMaterial(color: .init(.green))
    
    @State private var points: [[(SIMD3<Float>, Int, ModelEntity, ModelEntity, Float)]] = [] // [coord, centroid number, 3Dentity, line]
    @State private var centroids: [(SIMD3<Float>, Int, ModelEntity)] = [] // coord, centroid number, 3D entity
    
    var clusters = 16
    var pointsPerCluster = 80
    
    var body: some View {
        VStack {
            Button(action: {
                updateCentroids()
            }) {
                Text("Press Me")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            RealityView { content in
                
                // For each cluster:
                // Initialise centroid location, and cluster location
                // For each point around cluster, normally distribute in 3 dimensions
                    
                var cluster_positions: [SIMD3<Float>] = []
                var all_points: [SIMD3<Float>] = []
                
                for i in 0...clusters {

                    var cluster_position: SIMD3<Float> = [
                        Float.random(in: -0.2...0.2),
                        Float.random(in: -0.2...0.2),
                        Float.random(in: -0.2...0.2)
                    ]
                    // Re-initialise point if it's too close to the rest.
                    while tooClose(minimumSeparation: 0.05, candidatePoint: cluster_position, otherPoints: cluster_positions) {
                        cluster_position = [
                            Float.random(in: -0.2...0.2),
                            Float.random(in: -0.2...0.2),
                            Float.random(in: -0.2...0.2)
                        ]
                    }
                    
                    // For each cluster, initialise an amount of points.
                    var cluster_points: [(SIMD3<Float>, Int, ModelEntity, ModelEntity, Float)] = []
                    for ii in 0...pointsPerCluster {
                        
                        let point_offset: SIMD3<Float> = [
                            randomNormal()*2.0,
                            randomNormal()*2.0,
                            randomNormal()*2.0
                        ]
                        
                        all_points.append(cluster_position + point_offset)
                        
                        cluster_points.append((
                            cluster_position + point_offset,
                            i,
                            ModelEntity(mesh: meshSmall, materials: [redMaterial]),
                            ModelEntity(mesh: .generateBox(size: [0.2, 0.07, 0.07])),
                            Float(0)
                        ))
                        
                    }
                    
                    // Initialise Centroids and Cluster locations
                    let centroid_position: SIMD3<Float> = all_points.randomElement() ?? [0.0, 0.0, 0.0]
                    
                    centroids.append((
                        centroid_position,
                        i,
                        ModelEntity(mesh: meshSmall, materials: [greenMaterial])
                    ))
                    cluster_positions.append(cluster_position)
                    
                    points.append(cluster_points)
                }
                        
                
                for centroid in centroids {
                    let modelEntity = centroid.2
                    modelEntity.position = centroid.0
                    
                    //modelEntity.model?.mesh = meshSmall
                    
                    //modelEntity.model?.materials = [redMaterial]
                    content.add(modelEntity)
                }
                
                for (i, cluster_points_group) in points.enumerated() {
                    for (ii, point) in cluster_points_group.enumerated() {
                        let modelEntity = point.2
                        modelEntity.position = point.0
                        
                        content.add(modelEntity)
                        
                        // Determine closest centroid.
                        var closestCentroid = centroids[0]
                        var closestDistance = Float(10000000.0)
                        for centroid in centroids {
                            let currentDistance = simd_distance(centroid.0, point.0)
                            if currentDistance < closestDistance {
                                closestCentroid = centroid
                                closestDistance = currentDistance
                            }
                        }
                        points[i][ii].1 = closestCentroid.1
                        var line = createLine(start: point.0, end: closestCentroid.0)
                        points[i][ii].3 = line
                        content.add(line)
                        points[i][ii].4 = closestDistance
                        
                    }
                }
                
                
                
                
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
    
    func randomNormal(mean: Double = 0.0, standardDeviation: Double = 0.02) -> Float {
        // Box-Muller Transform.
        let u1 = Double.random(in: 0..<1)
        let u2 = Double.random(in: 0..<1)
        let z0 = sqrt(-2.0 * log(u1)) * cos(2.0 * .pi * u2)
        return Float(z0 * standardDeviation + mean)
    }
    
    func createLine(start: SIMD3<Float>, end: SIMD3<Float>, thickness: Float = 0.1) -> ModelEntity {
        /* 1. Calculate the vector and length
        let direction = end - start
        let length = simd_length(direction)
        
        // 2. Create the box mesh (thin in two dimensions)
        let mesh = MeshResource.generateBox(size: [thickness, thickness, length])
        let material = SimpleMaterial(color: .red, isMetallic: false)
        let lineEntity = ModelEntity(mesh: mesh, materials: [material])
        
        // 3. Position the box halfway between start and end
        let midPoint = (start + end) / 2
        lineEntity.position = midPoint
        
        // 4. Rotate the box to align with the direction vector
        lineEntity.look(at: end, from: midPoint, relativeTo: nil)
         */
        
        let direction = end - start
        let length = simd_length(direction)
        let midPoint = (start + end) / 2.0
        let axis = simd_normalize(direction)

        // Create a box with minimal thickness, representing the line
        let mesh = MeshResource.generateBox(size: [0.0012, 0.0012, length])
        let material = SimpleMaterial(color: .blue, isMetallic: false)
        let lineEntity = ModelEntity(mesh: mesh, materials: [material])
        
        // Rotate the box to align with the direction vector
        let rotation = simd_quatf(from: [0, 0, 1], to: axis)
        lineEntity.orientation = rotation
        lineEntity.position = midPoint
        
        return lineEntity
    }
    
    func updateLine(lineEntity: ModelEntity, start: SIMD3<Float>, end: SIMD3<Float>, originalDistance: Float) {
        let direction_vector = end - start
        let length = simd_length(direction_vector)
        let midPoint = (start + end) / 2.0
        let axis = simd_normalize(direction_vector)
        
        // Assuming original size along Z was 1.0; adjust scale accordingly
        let scaleFactor = length / (originalDistance)
        lineEntity.scale = SIMD3<Float>(repeating: 1)
        lineEntity.scale.z = scaleFactor

        // Set rotation
        let rotation = simd_quatf(from: [0, 0, 1], to: axis)
        lineEntity.orientation = rotation

        // Set position
        lineEntity.position = midPoint
        
    }
    
    func updateCentroids() {
        
        var centroid_points_groups: [[SIMD3<Float>]] = []
        var mean_positions: [SIMD3<Float>] = []
        
        for (i, _) in centroids.enumerated() {
            centroid_points_groups.append([])
        }
        
        for (i, cluster_points_group) in points.enumerated() {
            for (ii, point) in cluster_points_group.enumerated() {
                
                centroid_points_groups[point.1].append(point.0)
                
            }
        }
        
        for centroid_points_group in centroid_points_groups {
            if centroid_points_group.isEmpty {
                mean_positions.append([0.0, 0.0, 0.0])
                continue
            }
            
            let sum = centroid_points_group.reduce(SIMD3<Float>(repeating: 0), +)
            let average = sum / Float(centroid_points_group.count)
            mean_positions.append(average)
        }
        
        for (i, mean_position) in mean_positions.enumerated() {
            centroids[i].0 = mean_position
        }
        
        for centroid in centroids {
            let modelEntity = centroid.2
            modelEntity.position = centroid.0
            //content.add(modelEntity)
        }
        
        for (i, cluster_points_group) in points.enumerated() {
            for (ii, point) in cluster_points_group.enumerated() {
                let modelEntity = point.2
                modelEntity.position = point.0
                
                // Determine closest centroid.
                var closestCentroid = centroids[0]
                var closestDistance = Float(10000000.0)
                for centroid in centroids {
                    let currentDistance = simd_distance(centroid.0, point.0)
                    if currentDistance < closestDistance {
                        closestCentroid = centroid
                        closestDistance = currentDistance
                    }
                }
                
                let the_current_distance = point.3.scale.z * (point.3.model?.mesh.bounds.extents.z ?? 0.0)
                
                points[i][ii].1 = closestCentroid.1
                updateLine(lineEntity: point.3, start: point.0, end: closestCentroid.0, originalDistance: points[i][ii].4)
                //points[i][ii].4 = closestDistance
                
            }
        }
    }

}

#Preview() {
    ThreeDGraph()
}
