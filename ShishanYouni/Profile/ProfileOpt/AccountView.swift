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
    var body: some View {
        //@state var loginStatus: Bool
        NavigationView{
            VStack(alignment: .leading){
                Text("未绑定")
                    .font(.title)
                
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
                Button(action: {}){
                    Text("登陆")
                }.buttonStyle(.bordered)
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
