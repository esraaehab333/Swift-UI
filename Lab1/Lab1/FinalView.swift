//
//  FinalView.swift
//  Lab1
//
//  Created by Nemo on 31/05/2026.
//

import SwiftUI

struct FinalView: View {
    @State var inputText : String = ""
    @State private var displayedText: String = "Welcome"
    var body: some View {
        VStack{
            MyMap().frame(height: 300)
            MyImage().padding(.top , -100)
            Text(displayedText).foregroundColor(.red).font(.largeTitle).bold()
            HStack{
                Text("Park state")
                Spacer()
                Text("Park City")
            }.padding()
            Divider().padding()
            TextField("enter text", text: $inputText).padding()
            Button("Click me", action: {
                displayedText = inputText
                }
            ).foregroundColor(.red)
        }
        Spacer()
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
