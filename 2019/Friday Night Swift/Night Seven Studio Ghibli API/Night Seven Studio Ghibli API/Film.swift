//
//  Film.swift
//  Night Seven Studio Ghibli API
//
//  Created by Caleb Wells on 5/3/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import Foundation

struct Film: Decodable {
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
}
