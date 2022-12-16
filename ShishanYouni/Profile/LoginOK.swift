//
//  LoginOK.swift
//  ShishanYouni
//
//  Created by jerry on 2022/12/5.
//

import SwiftUI

struct LoginOK: View {
    @State var status: Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .opacity(0.8)
            if status{
                Text("登陆成功")
                    .foregroundColor(.white)
            }else{
                Text("登陆失败")
                    .foregroundColor(.white)
            }
            
        }
        .frame(width: 100,height: 100)
    }
}

struct LoginOK_Previews: PreviewProvider {
    static var previews: some View {
        LoginOK(status: true)
    }
}
