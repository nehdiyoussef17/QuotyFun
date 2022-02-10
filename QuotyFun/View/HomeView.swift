//
//  HomeView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import Foundation
import SwiftUI




struct HomeView : View {
    @State var show = false
    var body: some View{
        NavigationView{
            ZStack{
                NavigationLink( destination: SignUpView(show: self.$show), isActive: self.$show){
                    Text("")
                }
                .hidden()
                LoginView(show: $show) 
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
