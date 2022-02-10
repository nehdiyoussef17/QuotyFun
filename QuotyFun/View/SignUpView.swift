//
//  SignUpView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import Foundation
import SwiftUI

struct SignUpView : View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool

    
    
    var body: some View{
        
        ZStack(alignment: .topLeading){
            GeometryReader{_ in
                
                VStack{
                    
                    Image("QuotyFun")
                        .resizable()
                        .frame(width: 170.0, height: 170.0)
                        .padding(.top, 50)
                    Text("Welcome to QuotyFun !")
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
                    }
                    .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color"): self.color,lineWidth: 2))
                        .padding(.top, 25)
                    
                    HStack(spacing: 15){
                        if self.revisible{
                            TextField("Re-enter",text: self.$repass)
                        }
                        else{
                            SecureField("Re-enter",text: self.$repass)
                        }
                        
                        Button(action: {
                            self.revisible.toggle()
                        }){
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                            
                        }
                    }.padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color"): self.color,lineWidth: 2))
                        .padding(.top, 25)

                    
                    Button(action: {
                        
                        
                        
                        
                        
                    }){
                        Text("Register")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 55)
                    
                }
                .padding(.horizontal, 25)
            }
            
            Button(action: {
                self.show.toggle()

            }){
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color("Color"))
            }
                .padding()
                
            
        }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)

    }
}

struct SignUp_preview: PreviewProvider {
    static var previews: some View {
        SignUpView(show : Binding.constant(true))
    }
}
