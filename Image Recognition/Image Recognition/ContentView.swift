//
//  ContentView.swift
//  Image Recognition
//
//  Created by Utkarsh Raj on 01/11/24.
//

import SwiftUI
import PhotosUI
import CoreML

struct ContentView: View {
    @State private var selectedImageItem: PhotosPickerItem? = nil
    @State private var uiImage: UIImage? = nil
    @State private var isAnimation = false
    let model = try! CatsVsDogsClassifier(configuration: MLModelConfiguration())
    @State private var probs: [String: Double] = [:]
    var result : [(String, Double)] {
        return Array(zip(probs.keys,probs.values))
    }
    var sortedProbs:[Dictionary<String, Double>.Element] {
        let probsArray = Array(probs)
        return probsArray.sorted { lhs, rhs in
            lhs.value > rhs.value
        }
    }
    var body: some View {
        VStack {
            if let image = uiImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimation ? 0 : -40)
                    .frame(width: 240, height: 240)
                    .animation(.easeInOut(duration: 0.4), value: isAnimation)
                    .onAppear {
                        isAnimation = true
                    }

            }

            HStack {
                PhotosPicker(selection: $selectedImageItem, matching: .images) {
                    Text("Select a photo")
                }
                .buttonStyle(.borderedProminent)
            }
            
            Button(action: {

                do {
                    guard let uiImage = uiImage else {
                        return
                    }
                    let resized = uiImage.resize(to: CGSize(width: 299, height: 299))
                    guard let buffer = resized.buffer() else {return}
                    let result = try model.prediction(image: buffer)
                    probs = result.classLabelProbs
                    print(probs)
                } catch let error {
                    print(error.localizedDescription)
                }
                
            }, label: {
                Text("Predict")
            })
            .buttonStyle(.bordered)

            List {
                ForEach(0..<result.count, id: \.self) { index in
                    HStack {
                        Text("\(result[index].0)")
                        Spacer()
                        Text("\(result[index].1)")
                    }
                }
            }
            
            
        }
        .padding()
        .onChange(of: selectedImageItem) { oldValue, newValue in
            newValue?.loadTransferable(type: Data.self, completionHandler: { result in
                switch result {
                case .success(let data):
                    if let data = data, let img = UIImage(data: data) {
                        uiImage = img
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
