//
//  Result.swift
//  FootResultat
//
//  Created by Antoine Frau on 13/11/2019.
//  Copyright © 2019 Antoine Frau. All rights reserved.
//

import Foundation

class Result {
    var matchList: [Match] = []
    
    init? (json: [String: Any]) {
        guard let results = json["resultats"] as? [[String: Any]]
            else {
                return nil
            }
        
        for match in results {

            let id = match["id"]
            let dom_name = match["dom_name"]
            let dom_logo_name = match["dom_logo_name"]
            let dom_logo_url = match["dom_logo_url"]
            let ext_name = match["ext_name"]
            let ext_logo_name = match["ext_logo_name"]
            let ext_logo_url = match["ext_logo_url"]
            let date = match["date"]
            let score = match["score"]
            
            let newMatch = Match(id: id as! String,
                                 dom_name: dom_name as! String,
                                 dom_logo_name: dom_logo_name as! String,
                                 dom_logo_url: dom_logo_url as! String,
                                 ext_name: ext_name as! String,
                                 ext_logo_name: ext_logo_name as! String,
                                 ext_logo_url: ext_logo_url as! String,
                                 date: date as! String,
                                 score: score as! String)
            matchList.append(newMatch)
        }
        
    }
}
