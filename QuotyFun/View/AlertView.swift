//
//  WelcomeView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import SwiftUI

struct AlertView: View {
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    @Binding var type : String
    @Binding var couleur : String
    
    var body: some View {
        GeometryReader{_ in
            VStack{
                HStack{
                    Text(type)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                
                Button(action: {
                    self.alert.toggle()
                })
                {
                    Text("Ok !")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 160)
                }
                .background(Color(couleur))
                .cornerRadius(10)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal,30)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
        
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(alert: Binding.constant(true), error: Binding.constant(""),type: Binding.constant("Test"),couleur: Binding.constant("a7mer"))
    }
}
