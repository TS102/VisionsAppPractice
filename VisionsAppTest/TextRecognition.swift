//
//  TextRecognition.swift
//  VisionsAppTest
//
//  Created by Tyler Sun on 6/26/23.
//

import Foundation
import SwiftUI
import VisionKit

struct TextRecognition {
     var scannedImages = [UIImage]
    @ObservedObject var recognizedContent: recognizedContent
    var didFinishRecognition: () -> Void
    
    
    private func getTextRecognitionRequest(with textItem: TextItem) -> VNRecognizeTextRequest {
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
        
        guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
        
        observations.forEach { observations in
            guard let recognizedText = observations.topCandidates(1).first else { return }
            
            textItem.text += recognizedText.string
            textItem.text += "\n"
        }
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
    }
    

}
