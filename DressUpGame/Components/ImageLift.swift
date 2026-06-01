//
//  ImageLift.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 01/06/26.
//

import SwiftUI
import VisionKit

@MainActor
struct ImageLift: UIViewRepresentable {
    
    let image: UIImage
    
    @Binding var subject: UIImage?
    
    let imageView = LiftImageView()
    let analyzer = ImageAnalyzer()
    let interaction = ImageAnalysisInteraction()
    
    func makeUIView(context: Context) -> some UIView {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.addInteraction(interaction)
        return imageView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        Task {
            if let image = imageView.image {
                let configuration = ImageAnalyzer.Configuration([
                    .text, .visualLookUp, .machineReadableCode,
                ])
                let analysis = try await analyzer.analyze(
                    image,
                    configuration: configuration
                )
                interaction.analysis = analysis
                interaction.preferredInteractionTypes = []
                subject = try await interaction.image(for: interaction.subjects)
            }
        }
    }
}

class LiftImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        .zero
    }
}
