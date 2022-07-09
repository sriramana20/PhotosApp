//
//  PhotosViewModel.swift
//  PhotoList
//
//  Created by sriramana koppisetti on 07/07/22.
//

import Combine
import SwiftUI

class PhotosViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var images: [ImageModel] = []
    
    func fetchImages() {
        NetworkManager.shared.getData(endpoint: .breeds, type: ImageModel.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] imageData in
                self?.images = imageData
            }
            .store(in: &cancellables)
        }
}
