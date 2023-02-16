//
//  ImagePicker.swift
//  ProjectForLearning
//
//  Created by Евгений Карась on 13.02.23.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
     @Binding var image: UIImage?
     @Binding var isPresented: Bool
     
     func makeCoordinator() -> ImagePickerViewCoordinator {
         return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
     }
     
     func makeUIViewController(context: Context) -> UIImagePickerController {
         let pickerController = UIImagePickerController()
         pickerController.sourceType = sourceType
         pickerController.delegate = context.coordinator
         return pickerController
     }

     func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: UIImage?
    @Binding var isPresented: Bool
    
    init(image: Binding<UIImage?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage { 
            self.image = image
        }
        isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isPresented = false
    }
    
}

