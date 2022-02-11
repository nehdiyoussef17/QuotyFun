//
//  SignUpView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import Foundation
import SwiftUI
import Firebase

struct SignUpView : View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var error = ""
    @State var type : AlertViewType?

    
    
    var body: some View{
        
        ZStack{
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
                            .autocapitalization(.none)

                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color"): self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        
                        HStack(spacing: 15){
                            if self.visible{
                                TextField("Password",text: self.$pass)
                                    .autocapitalization(.none)

                            }
                            else{
                                SecureField("Password",text: self.$pass)
                                    .autocapitalization(.none)

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
                            
                            self.register()
                            
                            
                            
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
                    
                
            }
            
            if type != nil {
                AlertView( error: self.error, type: $type)
            }
            
            
        }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    func register(){
        if self.email != "" {
            if self.pass == self.repass{
                Auth.auth().createUser(withEmail: self.email, password: self.pass){
                    (res,err)in
                    
                    if err != nil{
                        self.error=err!.localizedDescription
                        self.type = .Error
                        
                        return
                    }
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    self.error = "Welcome"
                    self.type = .Success
                    
                   
                }
            }
            else{
                self.error = "Password mismatch"
                self.type = .Warning
                
            }
        }
        else{
            self.error = "Please fill all the content properly"
            self.type = .Error
           
        }
        
    }
}

struct SignUp_preview: PreviewProvider {
    static var previews: some View {
        SignUpView(show : Binding.constant(true))
    }
}
