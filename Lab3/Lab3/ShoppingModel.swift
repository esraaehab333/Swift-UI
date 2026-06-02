//
//  ShoppingModel.swift
//  Lab3
//
//  Created by Nemo on 02/06/2026.
//

import SwiftUI

class ShoppingModel: ObservableObject {
    @Published var text : String = ""
    @Published var array : [String] = []
    func addToList(){
        if !text.isEmpty{
            array.append(text)
            text = "" // clear the text field
        }
    }
}
