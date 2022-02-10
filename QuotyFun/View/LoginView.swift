//
//  HomeView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import Foundation
import SwiftUI




struct LoginView : View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    
    
    
    var body: some View{
        ZStack(alignment: .topTrailing){
            GeometryReader{_ in
                
                VStack{
                    
                    Image("QuotyFun")
                        .resizable()
                        .frame(width: 222.0, height: 222.0)
                        .padding(.top, 70)
                    Text("Log in to your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top, 35)
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"): self.color,lineWidth: 2))
                        .padding(.top, 25)
                    
                    
                    HStack(spacing: 15){
                        if self.visible{
                            TextField("Password",text: self.$pass)
                        }
                        else{
                            SecureField("Password",text: self.$pass)
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }){
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                            
                        }
                    }.padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color"): self.color,lineWidth: 2))
                        .padding(.top, 25)
                    
                    Button(action: {
                        
                    }){
                        Text("Log in")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                    HStack{
                        Button(action: {
                            
                        }) {
                            Text("Forget Password")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color"))
                        }
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 25)
            }
            
            Button(action: {
                self.show.toggle()
            }){
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
    }
}

