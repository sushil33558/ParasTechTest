//
//  TestScreenModel.swift
//  PtTest
//
//  Created by sushil Chaudhary on 10/11/22.


import Foundation

// MARK: - TestData
struct TestData: Codable {
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case  data
    }
}

// MARK: - Datum
struct Datum: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let experienceName: String
    let categoryName: CategoryName
    let expID: String
    let image: String
    let amount: String
    let username: Username
    let userImage: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case experienceName = "experience_name"
        case categoryName = "category_name"
        case expID = "expId"
        case image, amount, username, userImage, status
    }
}

enum CategoryName: String, Codable {
    case adventure = "Adventure"
    case apprentice1 = "Apprentice 1"
    case apprenticeship = "Apprenticeship"
    case artAndCulture = "Art and Culture"
    case creative = "Creative"
    case dating = "Dating"
    case designers = "Designers"
    case enterinment = "Enterinment"
    case events = "Events"
    case family = "Family"
    case wingWoMen = "Wing(wo)men"
}

enum Username: String, Codable {
    case amit = "Amit"
    case android = "Android"
    case mobile = "mobile"
    case new = "new"
    case paras = "paras"
    case priyanka = "priyanka"
    case priynkkka = "priynkkka"
    case puneet = "Puneet"
    case serma = "Serma"
}
