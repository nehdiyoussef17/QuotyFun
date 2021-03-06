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
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View{
        NavigationView{
            VStack{
                if self.status{
                    ContentView(quoteViewModel: QuoteViewModel(quoteService: QuotesService()))
                }
                else{
                    ZStack{
                        NavigationLink( destination: SignUpView(show: self.$show), isActive: self.$show){
                            Text("")
                        }
                        .hidden()
                        LoginView(show: $show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main){
                    (_) in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}











