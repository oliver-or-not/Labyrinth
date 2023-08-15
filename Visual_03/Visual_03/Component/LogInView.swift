//
//  LogInView.swift
//  Visual_03
//
//  Created by Wonil Lee on 2023/08/16.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        ZStack {
//            Color(.red)
//                .opacity(0.1)
//                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 270, height: 120)
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue, lineWidth: 1)
                .frame(width: 270, height: 120)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Spacer()
                        .frame(width: 15)
                    Text("이메일")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                    .frame(height: 25)
                Rectangle()
                    .fill(.blue)
                    .frame(width: 260, height: 1)
                HStack {
                    Spacer()
                        .frame(width: 15)
                    Text("암호")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                        .frame(width: 185)
                }
                Spacer()
                    .frame(height: 25)
            }
            
            Image(systemName: "arrow.right.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(red: 0.7, green: 0.8, blue: 1.0))
                .offset(x: 110, y: 30)
        }        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
