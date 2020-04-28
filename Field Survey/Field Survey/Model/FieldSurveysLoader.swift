//
//  FieldSurveysLoader.swift
//  Field Survey
//
//  Created by Molly Farnam on 4/28/20.
//  Copyright © 2020 Molly Farnam. All rights reserved.
//

import Foundation

class FieldSurveysLoader{
    class func load(jsonFileName: String) -> FieldSurveys? {
        var fieldSurveys: FieldSurveys?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                fieldSurveys = try? jsonDecoder.decode(FieldSurveys.self, from: jsonData)
        }
        
        return fieldSurveys
    }
}
