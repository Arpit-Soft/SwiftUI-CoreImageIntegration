//
//  ContentView.swift
//  SwiftUI-CoreImageIntegration
//
//  Created by Arpit Dixit on 31/07/21.
//

import SwiftUI

struct ContentView: View {
    
    let images = ["cat", "dog", "tree", "mountains"]
    @State private var selectedImage = ""
    
    @ObservedObject private var imageDetectionVM: ImageDetectionViewModel
    private var imageDetectionManager: ImageDetectionManager
    
    init() {
        imageDetectionManager = ImageDetectionManager()
        imageDetectionVM = ImageDetectionViewModel(imageDetectionManager)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView([.horizontal]) {
                    HStack {
                        ForEach(images, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .frame(width: 300, height: 300, alignment: .center)
                                .padding()
                                .onTapGesture {
                                    selectedImage = imageName
                                }
                                .border(Color.blue, width: selectedImage == imageName ? 5 : 0)
                        }
                    }
                }
                
                Button("Detect") {
                    imageDetectionVM.detect(selectedImage)
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.white)
                
                Text(imageDetectionVM.predictionLabel)
                    .padding([.top])
            }
            
            .navigationBarTitle("Core ML")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
