//
//  ContentView.swift
//  Image Recognition
//
//  Created by Utkarsh Raj on 01/11/24.
//

import SwiftUI

struct ContentView: View {
    private let images:[String] = ["1"]
    @State private var predictions: [String] = []
    var body: some View {
        VStack {
            Image(systemName: "apple")
            

            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Change Image")
                })
                .buttonStyle(.borderedProminent)
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Predict")
                })
                .buttonStyle(.borderedProminent)
                
            }
            
            List {
                ForEach(predictions, id: \.self ) { item in
                    Text(item)
                }
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
