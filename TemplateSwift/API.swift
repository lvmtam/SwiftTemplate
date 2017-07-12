//
//  API.swift
//  FontPattern
//
//  Created by Macbook Solution on 7/9/17.
//  Copyright © 2017 Macbook Solution. All rights reserved.
//

import Foundation
import Alamofire


enum HTTPMethod: String {
    case GET  = "GET"
    case POST = "POST"
    case UPDATE = "UPDATE"
    case DELETE = "DELETE"
}

protocol Router: URLRequestConvertible {
    var params: [String: Any] { get }
    var method: HTTPMethod { get }
    var path: String { get }
}


extension Router {
    func asURLRequest() throws -> URLRequest {
        let baseURL = try API.shared.baseURL.asURL()
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = 10
        // TODO: request configuration
        return try URLEncoding.default.encode(request, with: params)
    }
}


enum RoomRouter: Router {
    
    case getRooms
    case getRoom(String)
    case updateRoom(String, Any)
    
    var method: HTTPMethod {
        switch self {
        case .getRooms:         return .GET
        case .getRoom(_):       return .GET
        case .updateRoom(_, _): return .UPDATE
        }
    }
    
    var path: String {
        switch self {
        case .getRooms:             return "/room/"
        case .getRoom(let id):      return "/room/" + id
        case .updateRoom(let id, _):return "/room/" + id
        }
    }
    
    var params: [String : Any] {
        return [:]
    }
}



class API {
    
    static let shared = API()
    let baseURL = "https://192.168.17.1"
    let acceptedStatus = 200...399
    
    func updateRoom(roomId: String, completion: @escaping (Bool) -> Void) {
        Alamofire.request(RoomRouter.updateRoom(roomId, "info" /*e.g. Room class*/))
        .validate(statusCode: acceptedStatus)
        .responseJSON { response in
            // handle and do funny thing in here.
            completion(false)
        }
    }
    
    func fetchAllRooms(completion: @escaping ([Any /*e.g. Room model*/]) -> Void) {
        Alamofire.request(RoomRouter.getRooms)
        .validate(statusCode: acceptedStatus)
        .responseJSON { response in
            // handle and do funny thing in here.
            completion(["return", "list", "room model", "here"])
        }
    }
    
}

/*** USAGE ***/
/*
 * Call and receive simple
 *
API.shared.updateRoom(10) { success in
    // TODO: business workflow
}
*/



