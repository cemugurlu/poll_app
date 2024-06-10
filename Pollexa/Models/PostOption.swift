//
//  PostOption.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit

extension Post {
    struct Option: Decodable {
        let id: String
        let image: UIImage
        let percentage: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case imageName
            case percentage
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            let imageName = try container.decode(String.self, forKey: .imageName)
            percentage = try container.decode(Int.self, forKey: .percentage)
            if let image = UIImage(named: imageName) {
                self.image = image
            } else {
                throw DecodingError.dataCorruptedError(forKey: .imageName, in: container, debugDescription: "Image not found")
            }
        }
    }
}
