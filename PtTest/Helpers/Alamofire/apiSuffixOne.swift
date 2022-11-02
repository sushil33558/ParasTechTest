//
//  ApisSuffix.swift
//  GoFitNUp
//
//  Created by Sushil Choudhary on 16/01/21.
//  Copyright © 2021 sushil. All rights reserved.
//

import Foundation
enum APISuffix {
    case userHome
    
    func getDescription() -> String {
        switch self {
        case .userHome:
            return "main/userHome"
        default:
            print("not get URl.")
        }
          
    }
}
enum URLS {
    case baseUrl

    func getDescription() -> String {
        switch self {
        case .baseUrl:
            return "https://php.parastechnologies.in/blist/"
        default:
                print("not Found Base Url.")
        }
            
    }
}
