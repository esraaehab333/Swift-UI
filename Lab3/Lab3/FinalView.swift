//
//  FinalView.swift
//  Lab3
//
//  Created by Nemo on 02/06/2026.
//

import SwiftUI

struct FinalView : View {
    @StateObject private var model = ShoppingModel()
    var body: some View{
        NavigationView{
                VStack{
                    HStack{
                        TextField("Enter text here", text: $model.text).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                        Button(action: {
                            model.addToList()
                        }){
                            Text("Add")
                        }.buttonStyle(.borderless).padding()
                    }
                    List{
                        ForEach(model.array , id: \.self){ item in
                            Text(item)
                        }
                    }.padding()
                }.navigationTitle("Shopping List")
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
