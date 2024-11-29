//
//  SongController.swift
//  vapor-crud-API
//
//  Created by Md Refat Hossain on 25/11/2024.
//

import Foundation
import Vapor
import Fluent

struct SongController : RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let songs = routes.grouped("songs")
        songs.get(use: index)
    }
    
    func index(request: Request) throws -> EventLoopFuture<[Song]> {
        return Song.query(on: request.db).all()
    }
    
    
}
