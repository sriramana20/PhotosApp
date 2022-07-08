//
//  PhotoView.swift
//  PhotoList
//
//  Created by sriramana koppisetti on 07/07/22.
//

import Foundation
import SwiftUI

struct PhotoView: View {
     let imageInfo: ImageModel
    init(imageinfo: ImageModel) {
        self.imageInfo = imageinfo
    }
    
    var body: some View {
        VStack {
            if let img = imageInfo.image, let url = img.url, let urlStr = URL(string: url) {
                    CacheAsyncImage(url: urlStr) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 300, maxHeight: 100)
                                case .failure:
                                    EmptyView()
                                @unknown default:
                                    EmptyView()
                                }
                        }
            }
        }
    }
}
