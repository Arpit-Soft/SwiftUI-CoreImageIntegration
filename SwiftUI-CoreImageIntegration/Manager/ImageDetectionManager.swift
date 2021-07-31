//
//  ImageDetectionManager.swift
//  SwiftUI-CoreImageIntegration
//
//  Created by Arpit Dixit on 31/07/21.
//

import Foundation
import UIKit
import CoreML

class ImageDetectionManager {
    
    let model = Resnet50()
    
    func detect(_ img: UIImage) -> String? {
        
        guard let pixelBuffer = img.toCVPixelBuffer(),
              let prediction = try? model.prediction(image: pixelBuffer) else {
            return nil
        }
        
        return prediction.classLabel
    }
}
