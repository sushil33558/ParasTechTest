//
//  RequestBuilder.swift
//  TUWI
//
//  Created by MAC on 27/02/2021.
//  Copyright © 2021 MAC. All rights reserved.
//

import Foundation
import Alamofire

class RequestFilesData {
    let url: String
    var method: HTTPMethod = .post
    let parameters: baseParameters?
    var headers: [String : String]?
    let fileData: [Data]
    let fileName : [String]
    let fileMimetype : [String]
    let fileparam : [String]
    let numberOfFiles: Int
    
    init(url: (URLS , APISuffix), method: HTTPMethod, parameters: baseParameters? = nil, headers: Bool , fileData: [Data] , fileName : [String] , fileMimetype : [String] , fileParam : [String], numberOfFiles: Int) {
        self.url = url.0.getDescription() + url.1.getDescription()
        self.method = method
        self.parameters = parameters
      if let token = UserDefaults.standard.string(forKey: "token") {
                         print(token)
                         if(headers){
                            self.headers = [
                               "Authorization" : String(format: "Bearer: @%", token)
                            ]
                         }
                     }
        self.fileData = fileData
        self.fileMimetype = fileMimetype
        self.fileName = fileName
        self.fileparam = fileParam
        self.numberOfFiles = numberOfFiles
    }
    
    deinit {
        print(#file , "destructor called")
    }
}

class RequestFileData {
    let url: String
    var method: HTTPMethod = .post
    let parameters: baseParameters?
    var headers: [String : String]?
    let fileData: Data
    let fileName : String
    let fileMimetype : String
    let fileparam  :String
    
    init(url: (URLS , APISuffix), method: HTTPMethod, parameters: baseParameters? = nil, headers: Bool , fileData: Data , fileName : String , fileMimetype : String , fileParam : String) {
        self.url = url.0.getDescription() + url.1.getDescription()
        self.method = method
        self.parameters = parameters
        if let token = UserDefaults.standard.string(forKey: "token") {
            print(token)
            if(headers){
                self.headers = [
                   "Authorization" : "Bearer"+token,
                ]
            }
        }
        self.fileData = fileData
        self.fileMimetype = fileMimetype
        self.fileName = fileName
        self.fileparam = fileParam
    }
    
    deinit {
        print(#file , "destructor called")
    }
}

class Request {
    var url: String
    var method: HTTPMethod = .get
    var parameters: baseParameters?
    var headers: [String : String]?
    
    init(url: (URLS , APISuffix), method: HTTPMethod, parameters: baseParameters? = nil, headers: Bool) {
        self.url = url.0.getDescription() + url.1.getDescription()
        self.method = method
        self.parameters = parameters
        if let token = UserDefaults.standard.string(forKey: "token") {
                   print(token)
                   if(headers){
                    self.headers = [
                      // "Authorization" : String(format: "Bearer: @%", token)
                        "Authorization" : "Bearer "+token,
                    ]
                   }
                print("Headers: - \(headers)")
               }
    }
    
    deinit {
        print(#file , "destructor called")
    }
}
