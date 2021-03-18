//
//  MapPOI.swift
//  vesputi
//
//  Created by Vladimir Lyukov on 17.03.2021.
//

import CoreLocation
import Foundation

struct MapPOI {
    let id: Int
    let title: String
    let subtitle: String?
    let description: String?
    let position: CLLocationCoordinate2D
    let type: String
}

extension MapPOI: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, title, subtitle, description, position, type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        let pos = try container.decode([CLLocationDegrees].self, forKey: .position)
        guard pos.count == 2 else {
            throw DecodingError.dataCorruptedError(forKey: .position, in: container, debugDescription: "Expect 2 coordinates for POI in 'position' key")
        }
        self.position = CLLocationCoordinate2D(latitude: pos[1], longitude: pos[0])
        self.type = try container.decode(String.self, forKey: .type)
    }
}
