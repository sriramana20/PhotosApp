//
//  PhotosViewModel.swift
//  PhotoList
//
//  Created by sriramana koppisetti on 07/07/22.
//

import Combine
import SwiftUI

class PhotosViewModel: ObservableObject {
    private let url = "https://api.thecatapi.com/v1/breeds"
    private var task: AnyCancellable?
    
    @Published var images: [ImageModel] = []
    
    func fetchImages() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [ImageModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: \PhotosViewModel.images, on: self)
    }
}
