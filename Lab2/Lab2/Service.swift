//
//  Service.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import Foundation
let users : [User] = load(fileName: "users.json")
func load <T : Decodable>(fileName : String)-> T
{
    // get the file from the bundel
    //2
    var data : Data
    // 1
    guard let file = Bundle.main.url(forResource: fileName, withExtension:nil)
    else{
        fatalError("Error found")
    }
    //3
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("error found")
    }
    do{
        return try JSONDecoder().decode(T.self, from:data)
    }catch{
        fatalError("error found")
    }
    
}
