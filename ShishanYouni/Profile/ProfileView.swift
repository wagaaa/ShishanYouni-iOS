//
//  PersonView.swift
//  ShishanYouni
//
//  Created by jerry on 2022/9/13.
//
//, tapDestination: "AccountView()",tapDestination: "ShareView()",tapDestination: "AddGroupView()"

import SwiftUI
import ActivityView

struct ProfileView: View {
    @State private var item: ActivityItem?
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AboutView()) {
                    appMessageView
                }.buttonStyle(.plain)
                List {
                    Section {
                        NavigationLink(destination: AccountView()) {
                            listItemView(itemImage: "person", itemName: "绑定账户")
                        }
                        //NavigationLink(destination:ShareView()){
                        listItemView(itemImage: "square.and.arrow.up", itemName: "推荐给朋友")
                            .onTapGesture {
                            item = ActivityItem(
                                items: "This will be shared"
                            )

                        }.activitySheet($item)
                        //}
                        NavigationLink(destination: AddGroupView()) {
                            listItemView(itemImage: "person.2", itemName: "加入用户交流群")
                        }

                    }
                }
                    .listStyle(.insetGrouped)
                    //.navigationBarTitle("我的", displayMode: .inline)
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
    //var tapDestination: String
    var body: some View {
        //NavigationLink(destination: Text(tapDestination)){
        HStack {
            Label(itemName, systemImage: itemImage)
        }.padding(.vertical, 15)
        //}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
