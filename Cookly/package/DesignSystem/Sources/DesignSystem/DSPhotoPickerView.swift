//
//  DSPhotoPickerView.swift
//  DesignSystem
//
//  Created by TOPAL Mahmut-Ali on 06/11/2025.
//

import SwiftUI
import PhotosUI

public struct DSPhotoPickerView: View {
    @Binding var selectedImageName: String
    @State private var selectedItem: PhotosPickerItem?
    @Binding var selectedImage: UIImage?
    
    public init(selectedImageName: Binding<String>, selectedImage: Binding<UIImage?>) {
        self._selectedImageName = selectedImageName
        self._selectedImage = selectedImage
    }
    
    public var body: some View {
        VStack {
            if let image = selectedImage{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                    .padding()
            }else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 150)
                    .overlay(Text("Aucune image").foregroundColor(.gray))
                    .cornerRadius(10)
                    .padding()
            }
            PhotosPicker("Choisir une photo", selection: $selectedItem, matching: .images)
                .onChange(of: selectedItem){newItem in
                    Task {
                        guard let newItem else{
                            print("Aucun élément séléctionné")
                            return
                        }
                        do{
                            if let data = try? await newItem.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data){
                                selectedImage = uiImage
                                selectedImageName = "custom_image"
                                print("image selectionné")
                            }
                            else {
                                
                                
                                print("Impossible de charger l'image")
                            }
                        }catch {
                            print("Erreur de chargement de l'image : \(error.localizedDescription)")
                        }
                        
                    }
                    
                }
        }
    }
    
}
