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
        songs.post(use: create)
    }
    
    // Get Request
    func index(request: Request) throws -> EventLoopFuture<[Song]> {
        return Song.query(on: request.db).all()
    }
    
    // Post Request
    func create(request: Request) throws -> EventLoopFuture<HTTPStatus> {
        let song = try request.content.decode(Song.self)
        return song.save(on: request.db).transform(to: .ok)
    }
    
    
}
