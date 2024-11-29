//
//  Song.swift
//  vapor-crud-API
//
//  Created by Md Refat Hossain on 29/11/2024.
//

import Vapor
import Fluent

final class Song: Model, Content {
    static let schema: String = "songs"
    
    @ID(key: .id)
    var id : UUID?
    
    @Field(key: "title")
    var title: String
    
    init() {
        
    }
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}


