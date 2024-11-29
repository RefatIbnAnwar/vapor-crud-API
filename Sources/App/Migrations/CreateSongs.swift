//
//  CreateSongs.swift
//  vapor-crud-API
//
//  Created by Md Refat Hossain on 25/11/2024.
//

import Fluent

struct CreateSongs: Migration {
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs")
            .delete()
    }
    
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        return database.schema("songs")
            .id()
            .field("title", .string, .required)
            .create()
        
    }
}

