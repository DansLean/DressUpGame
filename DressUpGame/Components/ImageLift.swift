//
//  ImageLift.swift
//  DressUpGame
//
//  Created by Vírna Carvalho on 25/05/26.
//

import SwiftUI
import VisionKit

@MainActor
struct ImageLift: UIViewRepresentable {
//    var imageName: String
    var imageData: Data
    
    let imageView = LiftImageView()
    let analyzer = ImageAnalyzer()
    
    let interaction = ImageAnalysisInteraction()
    
    func makeCoordinator() -> Coordinator {
        .init()
    }
    
    func makeUIView(context: Context) -> some UIView {
        imageView.image = UIImage(data: imageData)
        imageView.contentMode = .scaleAspectFit
        interaction.delegate = context.coordinator
        imageView.addInteraction(interaction)
        return imageView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        Task {
            if let image = imageView.image {
                let configuration = ImageAnalyzer.Configuration([.text, .visualLookUp, .machineReadableCode])
                let analysis = try? await analyzer.analyze(image, configuration: configuration)
                if let analysis = analysis {
                    interaction.analysis = analysis
                    interaction.preferredInteractionTypes = .automatic
                }
            }
        }
    }
    
    class Coordinator: ImageAnalysisInteractionDelegate {
        func interaction(_ interaction: ImageAnalysisInteraction, highlightSelectedItemsDidChange highlightSelectedItems: Bool) {
            print(#function)
            Task {
                let subjects = await interaction.subjects
                let image = try? await interaction.image(for: subjects)
                print("SUBJECT IMAGE: \(image)")
            }
        }
    }
    
}

class LiftImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        .zero
    }
}
