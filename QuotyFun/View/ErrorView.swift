//
//  WelcomeView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import SwiftUI

struct ErrorView: View {
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        GeometryReader{_ in
            VStack{
                HStack{
                    Text("Error")
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
                    
                })
                {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 20)
            }
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal,30)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(alert: Binding.constant(true), error: Binding.constant(""))
    }
}
