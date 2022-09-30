//
//  PersonView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack{
                appMessageView
                List {
                    
                    Section {
                        listItemView(itemImage: "person", itemName: "绑定账户", tapDestination: "AccountView()")
                        listItemView(itemImage: "square.and.arrow.up", itemName: "推荐给朋友",tapDestination: "ShareView()")
                        listItemView(itemImage: "person.2", itemName: "加入用户交流群",tapDestination: "AddGroupView()")
                        
                    }
                }
                    .listStyle(.insetGrouped)
                    .navigationBarTitle("我的", displayMode: .inline)
            }
        }
            
    }
}

//应用信息
private var appMessageView: some View {
    ZStack {
        VStack(spacing: 15) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))

            Text("狮山有你")
                    .font(.system(size: 17))
            
        }.padding(.top, 40)
    }
}

protocol viewName {
    var name: String { get set }
}

//功能栏
struct listItemView: View {
    var itemImage: String
    var itemName: String
    var tapDestination: String
    var body: some View {
        NavigationLink(destination: Text(tapDestination)){
        HStack{
            Label(itemName, systemImage: itemImage)
        }.padding(.vertical, 15)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
