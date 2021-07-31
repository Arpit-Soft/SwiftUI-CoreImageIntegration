//
//  ImageDetectionViewModel.swift
//  SwiftUI-CoreImageIntegration
//
//  Created by Arpit Dixit on 31/07/21.
//

import Foundation
import SwiftUI
import Combine

class ImageDetectionViewModel: ObservableObject {
    
    var name: String = ""
    var manager: ImageDetectionManager
    
    @Published var predictionLabel: String = ""
    
    init(_ manager: ImageDetectionManager) {
        self.manager = manager
    }
    
    func detect(_ name: String) {
        
        let sourceImage = UIImage(named: name)
        
        guard let resizedImage = sourceImage?.resizeImage(targetSize: CGSize(width: 224, height: 224)) else {
            fatalError("Unable to resize the Image!")
        }
        
        if let label = manager.detect(resizedImage) {
            predictionLabel = label
        }
    }
}
