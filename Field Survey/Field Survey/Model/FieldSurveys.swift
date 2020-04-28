//
//  FieldSurvey.swift
//  Field Survey
//
//  Created by Molly Farnam on 4/28/20.
//  Copyright © 2020 Molly Farnam. All rights reserved.
//

import Foundation

enum Animals: String, Codable{
    case bird
    case amphibian
    case reptile
    case insect
    case fish
    case plant
    case mammal
}

struct FieldSurvey: Codable{
    var classification: Animals
    var title: String
    var description: String
    var date: Date
}
struct FieldSurveys: Codable{
    var status: String
    var observations: [FieldSurvey]
}
