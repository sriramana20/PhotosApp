//
//  DetailView.swift
//  PhotoList
//
//  Created by sriramana koppisetti on 08/07/22.
//

import Foundation
import SwiftUI

struct PhotoDetailView: View {
    @State var imageInfo : ImageModel?
    var body: some View {
        if let validImage = imageInfo {
            VStack {
                PhotoView(imageinfo: validImage)
                Text(validImage.description ?? "None").font(.title2).padding(8)
            }.navigationTitle(validImage.name ?? "")
        }
    }
}
