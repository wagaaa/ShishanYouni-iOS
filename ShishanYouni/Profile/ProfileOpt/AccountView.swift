//
//  AccountView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI
import ToastSwiftUI


struct AccountView: View {
    @State var user :userInfo = getUser()
    @State var passwd: String = ""
    @State var username: String = ""
    @State var loginStatus: Bool = false
    @State var toastOK = false
    @State var toastFail = true

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
                Form{
                    if loginStatus{
                        Text("已绑定")
                            .font(.largeTitle)
                    }else{
                        Text("未绑定")
                            .font(.largeTitle)
                    }
                    
                    HStack{
                        Text("学号：")
                        TextField("", text: $user.username)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack{
                        Text("密码：")
                        SecureField("", text: $user.passwd)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button(action: {
                        checkAccount(username: user.username, passwd: user.passwd)
                        user = getUser()
                        loginStatus = user.status
                        print("Button: ",loginStatus)
                    }){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50)
                            Text("登陆")
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
            }.padding()
        }
            .navigationTitle("账户设置")
            .navigationBarTitleDisplayMode(.inline)
            .toast(isPresenting: $toastOK, message: "绑定成功", icon: .success)
            .toast(isPresenting: $toastFail, message: "绑定失败", icon: .error)
    }
}




struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
