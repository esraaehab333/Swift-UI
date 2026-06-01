//
//  UserRow.swift
//  Lab2
//
//  Created by Nemo on 01/06/2026.
//

import SwiftUI

struct UserRow: View {
    let user: User
    
    // رابط الصورة المطلوبة في الواجب
    let imageUrl = URL(string: "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg")
    
    var body: some View {
        HStack(spacing: 12) {
            
            // تحميل الصورة ديناميكياً باستخدام AsyncImage
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .empty:
                    // مؤشر تحميل صغير لغاية ما الصورة تظهر
                    ProgressView()
                        .frame(width: 44, height: 44)
                case .success(let image):
                    // لما الصورة تتحمل بنجاح بنخليها دائرية وبنفس حجم الـ Row
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                default:
                    Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 44, height: 44)
                                            .foregroundColor(.blue)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                // Displays the user's actual name
                Text(user.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                // Displays the username handles underneath
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer() // Pushes content to the left edge cleanly
        }
        .padding(.vertical, 4)
    }
}
