//
//  AccountView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI



struct AccountView: View {
    @State var passwd: String = ""
    @State var username: String = ""
    @State var loginStatus: Bool = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Spacer()
                }
                if loginStatus{
                    Text("已绑定")
                        .font(.largeTitle)
                }else{
                    Text("未绑定")
                        .font(.largeTitle)
                }
                
                HStack{
                    Text("学号：")
                    TextField("", text: $username)
                        .textFieldStyle(.roundedBorder)
                }
                HStack{
                    Text("密码：")
                    SecureField("", text: $passwd)
                        .textFieldStyle(.roundedBorder)
                }
                Button(action: {getimgURL()}){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                        Text("登陆")
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }.padding()
        }
            .navigationTitle("账户设置")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
