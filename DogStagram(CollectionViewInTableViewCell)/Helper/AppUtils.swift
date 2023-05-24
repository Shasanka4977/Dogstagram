//
//  AppUtils.swift
//  DogStagram
//
//  Created by Shasanka Sahoo on 24/05/23.
//

import UIKit

final class AppUtils {
    static func RenderImage(imageAt imageURL: URL, to pointSize: CGSize, scale: CGFloat = UIScreen.main.scale, defaultImage: String, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
            guard let imageSource = CGImageSourceCreateWithURL(imageURL as CFURL, imageSourceOptions) else {
                DispatchQueue.main.async {
                    completion(UIImage(named: defaultImage)!)
                }
                return
            }
            let maxDimensionInPixels = max(pointSize.width, pointSize.height) * scale
            let downsampleOptions = [
                kCGImageSourceCreateThumbnailFromImageAlways: true,
                kCGImageSourceShouldCacheImmediately: true,
                kCGImageSourceCreateThumbnailWithTransform: true,
                kCGImageSourceThumbnailMaxPixelSize: maxDimensionInPixels
            ] as CFDictionary
            guard let downsampledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, downsampleOptions) else {
                DispatchQueue.main.async {
                    completion(UIImage(named: defaultImage)!)
                }
                return
            }
            DispatchQueue.main.async {
                completion(UIImage(cgImage: downsampledImage))
            }
        }
    }
}

