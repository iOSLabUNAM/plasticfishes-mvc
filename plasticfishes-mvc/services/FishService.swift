//
//  FishService.swift
//  plasticfishes-mvc
//
//  Created by Luis Ezcurdia on 9/14/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

struct FishService {
    static func list_all() -> [Fish] {
        let decoder = JSONDecoder()
        debugPrint(DataSource().fishes)
        let result = try? decoder.decode([Fish].self, from: DataSource().fishes)
        return result ?? []
    }
}
