//
//  NEXFLIXView.swift
//  SwiftUIPractice
//
//  Created by 최민경 on 9/7/24.
//

import SwiftUI

struct NEXFLIXView: View {
    
    @State private var headerText = "JACKFLIX"
    @State private var showExtraInfo = false
    @State private var email = ""
    @State private var password = ""
    @State private var nickname = ""
    @State private var location = ""
    @State private var referralCode = ""
    
    var body: some View {
        VStack {
            Text(headerText)
                .asNetflixForeground(color: .red)
                .font(.largeTitle)
                .padding(.bottom, 40)
            Group {
                CustomTextFieldView(placeholder: "이메일 주소 또는 전화번호", text: $email)
                CustomTextFieldView(placeholder: "비밀번호", text: $password)
                CustomTextFieldView(placeholder: "닉네임", text: $nickname)
                CustomTextFieldView(placeholder: "위치", text: $location)
                CustomTextFieldView(placeholder: "추천 코드 입력", text: $referralCode)
            }
            
            SignupButtonWrapper(headerText: $headerText)
                .padding()
            
            Toggle(isOn: $showExtraInfo) {
                Text("추가 정보 입력")
                    .asNetflixForeground(color: .white)
            }
            .padding()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}



#Preview {
    NEXFLIXView()
}

struct CustomTextFieldView: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .asNetflixBackground(color: .gray)
            .asNetflixForeground(color: .white)
            .padding(.vertical, 5)
    }
}

struct SignupButtonWrapper: View {
    
    @Binding var headerText: String
    
    var body: some View {
        Button(action: {
            headerText = "가입 완료!"
        }) {
            Text("회원가입")
                .asNetflixForeground(color: .white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(10)
        }
    }
}
