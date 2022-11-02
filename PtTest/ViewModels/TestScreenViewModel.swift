//
//  TestScreenViewModel.swift
//  PtTest
//
//  Created by Sushil Chaudhary on 10/11/22.
//

import Foundation
class TestScreenViewModel:BaseAPI{
    //MARK: - Model Declareation
    //-------------------------
    var model:TestData?
    
    //MARK: - Api implementation
    //-------------------------
    func TestDataApi(completion:@escaping(Bool,String)->()){
        super.hitApi(requests: Request(url: (URLS.baseUrl, APISuffix.userHome), method: .get, parameters: nil, headers: false)) { (recievedData, message, response) in
            if response == 1{
                if let data = recievedData as? [String:Any]{
                    do{
                        let jsonSer = try JSONSerialization.data(withJSONObject:data, options:.prettyPrinted)
                        self.model = try JSONDecoder().decode(TestData.self, from:jsonSer)
                        completion(true,message ?? "")
                    }catch{
                        print(error.localizedDescription)
                        completion(false,message ?? "")
                    }
                }else{
                    completion(false,message ?? "")
                }
            }else{
                completion(false,message ?? "")
            }
        }
    }
    
}
