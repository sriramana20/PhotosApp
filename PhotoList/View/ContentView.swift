//
//  ContentView.swift
//  PhotoList
//
//  Created by sriramana koppisetti on 07/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PhotosViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.images, id: \.self) { image in
                    NavigationLink(destination: PhotoDetailView(imageInfo: image)) {
                        PhotoView(imageinfo: image)
                    }
                }
            }.navigationBarTitle("Photos")
                .onAppear {
                    self.viewModel.fetchImages()
            }
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
