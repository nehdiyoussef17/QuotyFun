//
//  HomeView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import Foundation
import SwiftUI
import Firebase




struct LoginView : View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    @State var type = ""
    @State var couleur = ""
    
    
    
    
    var body: some View{
        ZStack{
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
                        self.verify()
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
            
            if self.alert {
                AlertView(alert: self.$alert, error: self.$error, type: self.$type,couleur : self.$couleur)
            }
        }
    }
    
    func verify(){
        if self.email != "" && self.pass != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res,err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                }
                else{
                self.error = "Welcome"
                self.type = "Success"
                self.alert.toggle()
                self.couleur = "a5dher"
                    
                }
            }
            
            
            
            
        }
        else {
            self.error = "Please fill all fields properly"
            self.type = "Error"
            self.alert.toggle()
            self.couleur = "a7mer"
        }
    }
}









struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(show : Binding.constant(true))
    }
}
