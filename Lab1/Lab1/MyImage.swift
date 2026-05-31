//
//  MyImage.swift
//  Lab1
//
//  Created by Nemo on 31/05/2026.
//

import SwiftUI

struct MyImage: View {
    var body: some View {
        Image("pyramids")
            .resizable()
            .clipShape(Circle())
            .frame(width : 150 , height: 150 , alignment: .center)
            .shadow(radius: 10)
            .overlay{
                Circle().stroke(Color.black , lineWidth: 2)
            }
    }
}


struct MyImage_Previews: PreviewProvider {
    static var previews: some View {
        MyImage()
    }
}
