//
//  Fish.swift
//  plasticfishes-mvc
//
//  Created by Luis Ezcurdia on 9/14/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

struct Fish: Decodable {
    let id: String?
    let name: String
    let text: String
    let apiUrlString: String?
    let webUrlString: String?
    let imageUrlString: String?

    init(name: String, text: String) {
        self.id = nil
        self.name = name
        self.text = text
        self.apiUrlString = nil
        self.webUrlString = nil
        self.imageUrlString = nil
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case text
        case apiUrlString = "api_url"
        case webUrlString = "web_url"
        case imageUrlString = "image_url"
    }

    var apiURL: URL? {
        guard let url = apiUrlString else { return nil }
        return URL(string: url)
    }

    var webURL: URL? {
        guard let url = webUrlString else { return nil }
        return URL(string: url)
    }

    var imageURL: URL? {
        guard let url = imageUrlString else { return nil }
        return URL(string: url)
    }

    var imageData: Data? {
        guard let url = imageURL else { return nil }
        do {
            return try Data(contentsOf: url)
        } catch {
            return nil
        }
    }
}
