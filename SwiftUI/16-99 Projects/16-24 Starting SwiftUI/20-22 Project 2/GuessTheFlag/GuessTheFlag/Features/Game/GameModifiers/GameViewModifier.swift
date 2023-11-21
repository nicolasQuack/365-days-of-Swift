//
//  GameViewModifier.swift
//  Flags
//
//  Created by Nicolas Florencio Felipe on 07/11/23.
//

import SwiftUI

protocol ImageModifier {
    /// `Body` is derived from `View`
    associatedtype Body : View

    /// Modify an image by applying any modifications into `some View`
    func body(image: Image) -> Self.Body
}

extension Image {
    func modifier<M>(_ modifier: M) -> some View where M: ImageModifier {
        modifier.body(image: self)
    }
}

struct ImageRender: ImageModifier {
        
    func body(image: Image) -> some View {
        image
            .resizable()
            .clipShape(.buttonBorder)
            .shadow(radius: 10)
            .aspectRatio(1.7, contentMode: .fit)
    }
}

extension Image {
    func imageView () -> some View {
        modifier(ImageRender())
    }
}
